# class Obs {
#  int status;
#  Pid[] observers;
#
#   obs() {
#     this.status = 0
#     this.observers = [];
#   }
#
#   void attach(Pid obsever){
#     observables.push(obsever);
#   }
#
#   void detach(Pid obsever){
#     observables.remove(obsever);
#   }
#   ...
# }

defmodule Obs do
  use GenServer

  defstruct [:value, observers: []]

  def create(initial_value \\ 0) do
    state = %Obs{value: initial_value}
    GenServer.start_link(__MODULE__, state)
  end

  def init(state), do: {:ok, state}

  def add_observer(observers, observer_pid) do
    [observer_pid | observers]
  end

  def remove_observer(observers, observer_pid) do
    observers -- [observer_pid]
  end

  defp notify(state) do
    state.observers |> Enum.each(&send(&1, state.value))
  end

  def attach(subject), do: GenServer.cast(subject, {:attach, self()})
  def detach(subject), do: GenServer.cast(subject, {:detach, self()})

  def read(subject), do: GenServer.call(subject, :read)

  def handle_call(:read, _reader_id, state) do
    {:reply, state.value, state}
  end

  def handle_cast({:attach, observer_pid}, state) do
    new_observers = state.observers |> add_observer(observer_pid)
    {:noreply, Map.put(state, :observers, new_observers)}
  end

  def handle_cast({:detach, observer_pid}, state) do
    new_observers = state.observers |> remove_observer(observer_pid)
    {:noreply, Map.put(state, :observers, new_observers)}
  end

  ## Extending
  def handle_cast(:increment, state) do
    state = Map.put(state, :value, state.value + 1)
    notify(state)
    {:noreply, state}
  end

  def handle_cast(:decrement, state) do
    state = Map.put(state, :value, state.value - 1)
    notify(state)
    {:noreply, state}
  end

  def increment(subject), do: GenServer.cast(subject, :increment)
  def decrement(subject), do: GenServer.cast(subject, :decrement)

  def await(timeout) do
    receive do
      count -> count
    after
      2ß00 -> "There was not answer"
    end
  end
end

{:ok, subject} = Obs.create()
Obs.read(subject) |> IO.puts()
Obs.attach(subject)
Obs.read(subject) |> IO.puts()
Obs.increment(subject)
Obs.await() |> IO.puts()
Obs.increment(subject)
Obs.await() |> IO.puts()
Obs.decrement(subject)
Obs.await() |> IO.puts()
Obs.detach(subject)
Obs.increment(subject)
Obs.await() |> IO.puts()
IO.puts("The counter is #{Obs.read(subject)}")
