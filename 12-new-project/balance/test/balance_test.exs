defmodule BalanceTest do
  use ExUnit.Case
  doctest Balance

  test "Initial amount must't be negative" do
    {:error, reason} = Balance.create(-100)
    assert reason == "amount can't be negative"
  end

  test "Default initial amount must be zero" do
    {:ok, balance} = Balance.create()
    assert Balance.read(balance) == 0
  end

  test "Creates a balance with a initil amount" do
    {:ok, balance} = Balance.create(1000)
    assert Balance.read(balance) == 1000
  end

  test "Increments amount in 100" do
    {:ok, balance} = Balance.create(1000)
    amount = Balance.deposit(balance, 100)
    assert amount == 1100
    assert Balance.read(balance) == amount
  end

  test "Decrements amount in 30" do
    {:ok, balance} = Balance.create(1100)
    amount = Balance.withdraw(balance, 30)
    assert amount == 1070
    assert Balance.read(balance) == amount
  end
end
