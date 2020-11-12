defmodule GsAgentTest do
  use ExUnit.Case
  doctest GsAgent

  test "Raises an error on start" do
    reason = "some reason"
    {:error, e} = GsAgent.start_link(fn -> raise reason end)
    assert e.__struct__ == RuntimeError
    assert e.message == reason
  end

  test "Creates an agent and gets 3" do
    initial = 30
    {:ok, pid} = GsAgent.start_link(fn -> initial end)
    assert initial == GsAgent.get(pid, fn val -> val end)
    GsAgent.stop(pid)

    {:ok, pid} = GsAgent.start_link(fn -> {initial, true} end)
    ^initial = GsAgent.get(pid, fn {val, true} -> val end)
    true = GsAgent.get(pid, fn {_val, true} -> true end)
    GsAgent.stop(pid)
  end

  test "Updates the agent" do
    initial = 10
    {:ok, pid} = GsAgent.start_link(fn -> {initial, true} end)
    assert :ok == GsAgent.update(pid, fn {val, bool} -> {val + 1, not bool} end)
    expected = initial + 1
    {^expected, false} = GsAgent.get(pid, fn state -> state end)
    GsAgent.stop(pid)
  end

  test "stops the agent" do
    initial = 10
    {:ok, pid} = GsAgent.start_link(fn -> {initial, true} end)
    GsAgent.stop(pid)

    try do
      GsAgent.get(pid, fn state -> state end)
      raise "The agent is stop and must not get a value from state"
    catch
      :exit, _ -> nil
    end

    try do
      GsAgent.update(pid, fn state -> state end)
      raise "The agent is stop and must not update the state"
    catch
      :exit, _ -> nil
    end
  end
end
