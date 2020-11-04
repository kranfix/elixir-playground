defmodule Factorial do
  def fac1(n) when is_integer(n) do
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
  defp facp1(n, i, acc) do
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

  def fac2(n) do
    facp1(n, 0, 1)
  end
end

IO.puts(Factorial.fac1(6))
IO.puts(Factorial.fac2(5))
