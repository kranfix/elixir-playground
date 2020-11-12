defmodule GsAgent do
  use GenServer

  def start_link(on_create) when not is_nil(on_create) do
    try do
      GenServer.start_link(__MODULE__, on_create.())
    rescue
      e -> {:error, e}
    end
  end

  def init(state), do: {:ok, state}

  def get(agent, on_get), do: GenServer.call(agent, :read) |> on_get.()

  def update(agent, on_update), do: GenServer.call(agent, {:update, on_update})

  def stop(agent), do: GenServer.stop(agent)

  def handle_call(:read, _from_id, state) do
    {:reply, state, state}
  end

  def handle_call({:update, on_update}, _from_id, state) do
    {:reply, :ok, state |> on_update.()}
  end
end
