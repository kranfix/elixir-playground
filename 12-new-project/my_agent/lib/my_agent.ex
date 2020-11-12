defmodule MyAgent do
  def start_link(on_create) when not is_nil(on_create) do
    try do
      initial_state = on_create.()
      {:ok, spawn(fn -> loop({initial_state, true}) end)}
    rescue
      e -> {:error, e}
    end
  end

  def get(agent, on_get) when is_pid(agent) and not is_nil(on_get) do
    send(agent, {:get, self(), on_get})

    receive do
      :stop -> exit("The agent is stop")
      gotten -> gotten
    end
  end

  def update(agent, on_update) do
    send(agent, {:update, self(), on_update})

    receive do
      :stop -> exit("The agent is stop")
      :ok -> :ok
    end
  end

  def stop(agent), do: send(agent, {:stop, agent})

  defp loop({state, is_running}) do
    receive do
      {:get, from_pid, on_get} ->
        if is_running do
          gotten = on_get.(state)
          send(from_pid, gotten)
        else
          send(from_pid, :stop)
        end

        loop({state, is_running})

      {:update, from_pid, on_update} ->
        if is_running do
          new_state = on_update.(state)
          send(from_pid, :ok)
          loop({new_state, is_running})
        else
          send(from_pid, :stop)
          loop({state, is_running})
        end

      {:stop, _agent} ->
        loop({state, false})
        # Process.exit(agent, :kill)
    end
  end
end
