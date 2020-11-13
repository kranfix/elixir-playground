defmodule ScheduleServer do
  use Agent

  defstruct is_read: false, is_running: false, has_context: false

  def start_link() do
    Agent.start_link(fn -> %ScheduleServer{} end)
  end

  def read_system_config_file(server, config_file \\ "README.md") do
    IO.puts('Reading system config files...')

    state = Agent.get(server, fn state -> state end)

    cond do
      state.is_running ->
        IO.puts("The server is already running")
        {:error, :already_running}

      state.is_read ->
        IO.puts("The config files have been read")
        {:error, :already_read}

      true ->
        case File.read(config_file) do
          {:ok, _} ->
            IO.puts("Config files ok!")
            Agent.update(server, fn state -> %{state | :is_read => true} end)

          {:error, reason} ->
            {:error, reason}
        end
    end
  end

  def start(server) do
    state = Agent.get(server, fn state -> state end)

    cond do
      state.is_running ->
        IO.puts("The server is already running")
        {:error, :already_running}

      not state.is_read ->
        IO.puts("The config files are not loaded")
        {:error, :no_config_files}

      true ->
        IO.puts("Initializing")
        Agent.update(server, fn state -> %{state | :is_running => true} end)
    end
  end

  def initialize_context(server) do
    state = Agent.get(server, fn state -> state end)

    if not state.is_running do
      IO.puts("The server is not running")
      {:error, :server_not_running}
    else
      IO.puts("Initializing context")
      Agent.update(server, fn state -> %{state | :has_context => true} end)
    end
  end

  def destroy(server) do
    state = Agent.get(server, fn state -> state end)

    if state.has_context do
      IO.puts("Destroting")

      Agent.update(server, fn state ->
        state = %{state | :has_context => false}
        %{state | :is_running => false}
      end)
    else
      IO.puts("Destroying")
      {:error, :already_destroyed}
    end
  end

  def shutdown(server) do
    state = Agent.get(server, fn state -> state end)

    if state.is_running do
      IO.puts("The server must be destroyed first")
      {:error, :not_destroyed}
    else
      IO.puts("Shutdown...")
      Agent.stop(server)
    end
  end

  def read_system_config_file!(server, config_file \\ "README.md"),
    do: read_system_config_file(server, config_file) |> checker!()

  def start!(server), do: start(server) |> checker!()
  def initialize_context!(server), do: initialize_context(server) |> checker!()

  def checker!(answer) do
    case answer do
      :ok -> :ok
      {:error, atom_reason} -> raise atom_reason
    end
  end
end
