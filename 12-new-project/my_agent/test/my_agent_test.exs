defmodule MyAgentTest do
  use ExUnit.Case
  doctest MyAgent

  test "Raises an error on start" do
    reason = "some reason"
    {:error, e} = MyAgent.start_link(fn -> raise reason end)
    assert e.__struct__ == RuntimeError
    assert e.message == reason
  end

  test "Creates an agent and gets 3" do
    initial = 30
    {:ok, pid} = MyAgent.start_link(fn -> initial end)
    assert initial == MyAgent.get(pid, fn val -> val end)
    MyAgent.stop(pid)

    {:ok, pid} = MyAgent.start_link(fn -> {initial, true} end)
    ^initial = MyAgent.get(pid, fn {val, true} -> val end)
    true = MyAgent.get(pid, fn {_val, true} -> true end)
    MyAgent.stop(pid)
  end

  test "Updates the agent" do
    initial = 10
    {:ok, pid} = MyAgent.start_link(fn -> {initial, true} end)
    assert :ok == MyAgent.update(pid, fn {val, bool} -> {val + 1, not bool} end)
    expected = initial + 1
    {^expected, false} = MyAgent.get(pid, fn state -> state end)
    MyAgent.stop(pid)
  end

  test "stops the agent" do
    initial = 10
    {:ok, pid} = MyAgent.start_link(fn -> {initial, true} end)
    MyAgent.stop(pid)

    try do
      MyAgent.get(pid, fn state -> state end)
      raise "The agent is stop and must not get a value from state"
    catch
      :exit, _ -> nil
    end

    try do
      MyAgent.update(pid, fn state -> state end)
      raise "The agent is stop and must not update the state"
    catch
      :exit, _ -> nil
    end
  end
end
