defmodule Collatz do
  @typedoc """
  A Natural number is a positive Integer
  """
  @type natural :: integer

  @spec collatz1(natural()) :: natural()
  def collatz1(n) when is_integer(n) do
    IO.puts("Input: #{n}")
    IO.inspect(Process.info(self(), :current_stacktrace))

    z =
      cond do
        n == 1 -> 1
        rem(n, 2) == 0 -> collatz1(round(n / 2))
        true -> collatz1(3 * n + 1)
      end

    IO.puts("Onput: #{n}")
    # IO.inspect(Process.info(self(), :current_stacktrace))
    z
  end

  def collatz2(n) when is_integer(n) do
    IO.puts("Input: #{n}")
    IO.inspect(Process.info(self(), :current_stacktrace))

    cond do
      n == 1 -> 1
      rem(n, 2) == 0 -> collatz2(round(n / 2))
      true -> collatz2(3 * n + 1)
    end
  end

  def collatz3(1) do
    IO.puts("Input: #{1}")
    # IO.inspect(Process.info(self(), :current_stacktrace))
    1
  end

  def collatz3(n) when rem(n, 2) == 0 do
    IO.puts("Input: #{n}")
    # IO.inspect(Process.info(self(), :current_stacktrace))
    collatz3(round(n / 2))
  end

  def collatz3(n) do
    IO.puts("Input: #{n}")
    # IO.inspect(Process.info(self(), :current_stacktrace))
    collatz3(3 * n + 1)
  end
end

Collatz.collatz1(10)
# Collatz.collatz3(20)
