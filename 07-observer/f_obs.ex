defmodule FObs do
  @spec create(integer()) :: pid()
  def create(initialState \\ 0) do
    spawn(__MODULE__, :listen, [[], initialState])
  end

  def listen(observers, state) do
    receive do
      event ->
        {observers, state} = on_event(event, observers, state)
        listen(observers, state)
    end
  end

  def add_observer(observers, observer_pid) do
    [observer_pid | observers]
  end

  def remove_observer(observers, observer_pid) do
    observers -- [observer_pid]
  end

  defp notify(observers, state) do
    observers |> Enum.each(&send(&1, state))
    {observers, state}
  end

  def attach(subject), do: send(subject, {:attach, self()})
  def detach(subject), do: send(subject, {:attach, self()})

  def read(subject) do
    send(subject, {:read, self()})
    await()
  end

  def await() do
    receive do
      count -> count
    end
  end

  def on_event({:attach, observer_pid}, observers, state) do
    {observers |> add_observer(observer_pid), state}
  end

  def on_event({:detach, observer_pid}, observers, state) do
    {observers |> remove_observer(observer_pid), state}
  end

  def on_event({:read, reader_pid}, observers, state) do
    send(reader_pid, state)
    {observers, state}
  end

  ## Extending
  def on_event({:increment}, observers, state) do
    notify(observers, state + 1)
  end

  def on_event({:decrement}, observers, state) do
    notify(observers, state - 1)
  end

  def increment(subject), do: send(subject, {:increment})
  def decrement(subject), do: send(subject, {:decrement})
end

# subject = %Observable{pid: subject_pid}
# subject.attach(pid)
# subject.attach()
# subject.detach(pid)
# subject.detach()
# subject.read()
# subject.await()
# subject.increment()
# subject.decrement()
