defmodule Collatz do
  def collatz1(n) when is_integer(n) do
    IO.puts("Input:  #{n}")
    IO.inspect(Process.info(self(), :current_stacktrace))

    x =
      cond do
        n == 1 -> 1
        rem(n, 2) == 0 -> collatz1(round(n / 2))
        true -> collatz1(3 * n + 1)
      end

    # IO.inspect(Process.info(self(), :current_stacktrace))
    x
  end

  def collatz2(n, s) when is_integer(n) and is_integer(s) do
    IO.puts("Input:  #{n}")
    IO.inspect(Process.info(self(), :current_stacktrace))

    cond do
      n == 1 -> 1
      rem(n, 2) == 0 -> collatz2(round(n / 2), s + 1)
      true -> collatz2(3 * n + 1, s + 1)
    end
  end
end

Collatz.collatz2(10, 0)
