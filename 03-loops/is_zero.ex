defmodule Zero do
  # def is_zero(n) when is_integer(n) do
  #   n == 0
  # end

  def is_zero(0) do
    true
  end

  def is_zero(n) when is_integer(n) do
    false
  end
end

IO.puts(Zero.is_zero(0))
IO.puts(Zero.is_zero(1))
