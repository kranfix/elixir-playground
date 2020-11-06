defmodule Factorial do
  def classic(n) when is_integer(n) do
    cond do
      n < 2 -> 1
      true -> n * fac1(n - 1)
    end
  end

  # acc = 1;
  # for(int i = 0; i < n; i++){
  #   acc *= (i + 1); // acc = acc * (i + 1)
  # }
  # return acc;
  defp facp1(n, i, acc) when is_integer(n) do
    ## if i < n do
    ##   facp1(n, i + 1, acc * (i + 1))
    ## else
    ##   acc
    ## end
    cond do
      i == n -> acc
      true -> facp1(n, i + 1, acc * (i + 1))
    end
  end

  def fac1(n) when is_integer(n) do
    facp1(n, 0, 1)
  end

  # fac2(n) = Acc(n, k) * fac2(n - k)
  # Acc(n, k) = n * (n-1) * ... * (n - k + 1)
  # Acc(n, k) = Acc(n, k-1) * (n - k + 1)
  def fac2(n) when is_integer(n) do
    cond do
      n < 1 -> 1
      true -> facp2(n - 1, n)
    end
  end

  # defp facp2(n, acc) when is_integer(n) and n == 0 do
  #  acc
  # end
  defp facp2(0, acc) when is_integer(n) do
    acc
  end

  defp facp2(n, acc) when is_integer(n) do
    facp2(n - 1, acc * n)
  end
end

IO.puts(Factorial.classic(6))
IO.puts(Factorial.fac1(5))
IO.puts(Factorial.fac2(0))
IO.puts(Factorial.fac2(1))
