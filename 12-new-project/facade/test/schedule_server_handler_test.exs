defmodule ScheduleServerHandlerTest do
  use ExUnit.Case
  doctest ScheduleServerHandler

  test "Throws error because stops before starts" do
    {:ok, server} = ScheduleServer.start_link()
    handler = %ScheduleServerHandler{server: server}
    {:error, _} = ServerHandler.stop(handler)
  end

  test "starts with error because of a unkown file" do
    {:ok, server} = ScheduleServer.start_link()
    handler = %ScheduleServerHandler{server: server}
    {:error, e} = ServerHandler.start(handler, "unknown.md")
    assert e == :enoent
  end

  test "starts and stops server with success" do
    {:ok, server} = ScheduleServer.start_link()
    handler = %ScheduleServerHandler{server: server}
    assert ServerHandler.start(handler) == :ok
    assert ServerHandler.stop(handler) == :ok
  end

  test "starts and stops server with success with no default config file" do
    {:ok, server} = ScheduleServer.start_link()
    handler = %ScheduleServerHandler{server: server}
    assert ServerHandler.start(handler, "README.md") == :ok
    assert ServerHandler.stop(handler) == :ok
  end
end
