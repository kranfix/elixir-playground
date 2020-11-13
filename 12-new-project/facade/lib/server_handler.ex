defprotocol ServerHandler do
  def start(handler, config_file \\ "README.md")
  def stop(handler)
end

defmodule ScheduleServerHandler do
  @enforce_keys :server
  defstruct [:server]
end

defimpl ServerHandler, for: ScheduleServerHandler do
  def start(handler, config_file) do
    try do
      ScheduleServer.read_system_config_file!(handler.server, config_file)
      ScheduleServer.start!(handler.server)
      ScheduleServer.initialize_context!(handler.server)
    rescue
      e -> {:error, e.module}
    end
  end

  def stop(handler) do
    try do
      ScheduleServer.destroy(handler.server) |> ScheduleServer.checker!()
      ScheduleServer.shutdown(handler.server) |> ScheduleServer.checker!()
    rescue
      e -> {:error, e.message}
    end
  end
end
