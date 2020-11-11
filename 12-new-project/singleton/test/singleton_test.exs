defmodule MySingletonTest do
  use ExUnit.Case
  doctest MySingleton

  test "create singleton" do
    MySingleton.start_link("Hello")
    assert MySingleton.read() == "Hello"
    assert MySingleton.write("Hallo") == :ok
    assert MySingleton.read() == "Hallo"
  end

  test "Multiple declarations" do
    {:ok, single_pid} = MySingleton.start_link("Hello")

    {
      error,
      {:already_started, ^single_pid}
    } = MySingleton.start_link("Hallo")

    assert MySingleton.read() == "Hello"
  end
end
