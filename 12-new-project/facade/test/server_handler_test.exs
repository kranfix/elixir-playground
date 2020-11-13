defmodule ServerHandlerTest do
  use ExUnit.Case
  doctest ServerHandler

  defmodule HandlerMock do
    defstruct has_start_success: false, has_stop_success: false
  end

  defimpl ServerHandler, for: HandlerMock do
    def start(handler, _config_file) do
      if handler.has_start_success do
        :ok
      else
        {:error, "server start Failed"}
      end
    end

    def stop(handler) do
      if handler.has_stop_success do
        :ok
      else
        {:error, "server stop Failed"}
      end
    end
  end

  test "Throws error on start" do
    handler = %HandlerMock{}
    {:error, "server start Failed"} = ServerHandler.start(handler)

    handler = %HandlerMock{has_stop_success: true}
    {:error, "server start Failed"} = ServerHandler.start(handler)
  end

  test "Throws error on stop" do
    handler = %HandlerMock{}
    {:error, "server stop Failed"} = ServerHandler.stop(handler)

    handler = %HandlerMock{has_start_success: true}
    {:error, "server stop Failed"} = ServerHandler.stop(handler)
  end

  test "Has success for start and stop" do
    handler = %HandlerMock{has_start_success: true, has_stop_success: true}
    assert :ok == ServerHandler.start(handler)
    assert :ok == ServerHandler.stop(handler)
  end
end
