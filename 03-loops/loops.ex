defmodule Loop do
  # int i = 0;
  # while(true){
  #   unless(i < n) break;
  #   println(value);
  #   i++;
  # }
  def for_loop(i, n, value) do
    cond do
      i < n ->
        IO.puts("#{value} #{i}")
        for_loop(i + 1, n, value)

      true ->
        :ok
    end
  end

  # int i = 0;
  # while(true){
  #   println(value);
  #   i++;
  #   if(i == n) {
  #     break
  #   }
  # }
  def do_while1(i, n, value) when i < n do
    IO.puts("#{value} #{i}")
    do_while1(i + 1, n, value)
  end

  def do_while1(i, n, value) do
    :ok
  end

  def do_while2(i, n, value) do
    IO.puts("#{value} #{i}")

    cond do
      i + 1 < n -> do_while2(i + 1, n, value)
      true -> :ok
    end
  end
end

Loop.for_loop(0, 3, "for_loop")
Loop.do_while1(0, 4, "do_while1")
Loop.do_while2(0, 4, "do_while2")
