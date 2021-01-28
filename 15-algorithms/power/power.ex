defmodule Power do
  # b^n = b * (b^ (n-1))
  def power(_, 0), do: 1

  def power(base, exp) when is_integer(exp) and exp > 0 do
    base * power(base, exp - 1)
  end

  ############################
  def opt_power(b, n) when b > 0 and is_integer(n) and n >= 0 do
    opt_power_p(b, n, 1)
  end

  defp opt_power_p(_, 0, acc), do: acc

  defp opt_power_p(b, n, acc), do: opt_power_p(b, n - 1, b * acc)

  ############################
  def binpower(base, exp) when base > 0 and is_integer(exp) and exp >= 0 do
    binpower_p(base, exp)
  end

  defp binpower_p(_, 0), do: 1

  defp binpower_p(base, exp) when rem(exp, 2) == 0 do
    a = binpower_p(base, div(exp, 2))
    a * a
  end

  defp binpower_p(base, exp) when rem(exp, 2) == 1 do
    a = binpower_p(base, div(exp, 2))
    base * a * a
  end

  ############################
  def opt_binpower(b, n) when b > 0 and is_integer(n) and n >= 0 do
    opt_binpower_p(b, 1, n)
  end

  defp opt_binpower_p(_, acc, 0), do: acc
  defp opt_binpower_p(b, acc, n) when rem(n, 2) == 0, do: opt_binpower_p(b * b, acc, div(n, 2))

  defp opt_binpower_p(b, acc, n) when rem(n, 2) == 1,
    do: opt_binpower_p(b * b, b * acc, div(n - 1, 2))
end

Power.power(2, 7) |> IO.puts()
Power.opt_power(2, 7) |> IO.puts()
Power.binpower(2, 12) |> IO.puts()
Power.opt_binpower(2, 12) |> IO.puts()

# Power.opt_binpower(2, 12)
# Power.opt_binpower_p(2, 1, 12)
# Power.opt_binpower_p(4, 1, 6)
# Power.opt_binpower_p(16, 1, 3)
# Power.opt_binpower_p(256, 16, 1)
# Power.opt_binpower_p(512, 4096, 0) => 4046
