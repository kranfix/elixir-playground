defmodule IterInt do
  defmodule Map do
    def double(x) do
      2 * x
    end

    def triple(x) do
      3 * x
    end
  end

  defmodule Filter do
    def is_mod4(n) do
      rem(n, 4) == 0
    end

    def is_mod3_plus1(n) do
      rem(n, 3) == 1
    end

    def is_mod3_plus2(n) do
      rem(n, 3) == 2
    end
  end
end
