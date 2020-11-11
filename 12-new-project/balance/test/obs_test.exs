defmodule ObsTest do
  use ExUnit.Case
  doctest Obs

  test "%Obs default values" do
    obs = %Obs{value: 12}
    assert obs.observers == []
  end

  test "Create Obs with default value and read" do
    subject = Obs.create()
    value = Obs.read(subject)
    assert value == 0
  end

  # test "Create Obs with initial value and read" do
  #  subject = Obs.create(12)
  #  assert Obs.read(subject) == 12
  # end

  # test "Increments value without be attached" do
  #  subject = Obs.create()
  #  Obs.increment(subject)
  #  assert Obs.read(subject) == 1
  #  Obs.increment(subject)
  #  assert Obs.read(subject) == 2
  # end

  # test "Decrements value without be attached" do
  #  subject = Obs.create(12)
  #  Obs.decrement(subject)
  #  assert Obs.read(subject) == 11
  #  Obs.decrement(subject)
  #  assert Obs.read(subject) == 12
  # end

  # test "Increments value after attaching" do
  #  subject = Obs.create()
  #  Obs.attach(subject)
  #  Obs.increment(subject)
  #  assert Obs.await() == 1
  #  assert Obs.read(subject) == 1
  #  Obs.increment(subject)
  #  assert Obs.read(subject) == 2
  # end
end
