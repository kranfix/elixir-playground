defmodule EtsTest do
  use ExUnit.Case
  doctest MyEts

  test "writes a key without :set and two value" do
    table = :ets.new(:my_bucket, [:set, :protected])
    :ets.insert(table, {"perro", "dog"})
    :ets.insert_new(table, {"perro", "Hund"})
    assert [{"perro", "dog"}] == :ets.lookup(table, "perro")
    assert [{"perro", "dog"}] == :ets.lookup(table, "perro")
  end

  test "writes a key with :set and two value" do
    table = :ets.new(:my_bucket, [:set, :protected])
    :ets.insert(table, {"perro", "dog"})
    :ets.insert(table, {"perro", "Hund"})
    assert [{"perro", "Hund"}] == :ets.lookup(table, "perro")
    assert [] == :ets.lookup(table, "dog")
    assert [] == :ets.lookup(table, "Hund")
  end

  test "save a value it is not in the ETS" do
    table = :ets.new(:my_bucket, [:set, :protected])

    key = "like"
    assert :ets.lookup(table, key) == []
    {:new, 0} = read_value(table, key)
    {:already, 0} = read_value(table, key)
    assert update_data_to_db(table, key) == 1
    assert update_data_to_db(table, key) == 2
  end

  def read_value(table, key) do
    value = :ets.lookup(table, key)

    if value == [] do
      new_value = read_data_from_db()
      :ets.insert(table, {key, new_value})
      {:new, new_value}
    else
      {:already, value |> Enum.at(0) |> elem(1)}
    end
  end

  def read_data_from_db() do
    0
  end

  def update_data_to_db(table, key) do
    {_, value} = read_value(table, key)
    new_value = value + 1
    # you should write the db
    :ets.insert(table, {key, new_value})
    new_value
  end
end
