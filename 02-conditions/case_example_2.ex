# Simple variable
x = 5
y = case 10 do
  ^x -> "The value match with #{x}"
  _ -> "The value does not match with #{x}"
end
IO.puts y

# Tuples
{:ok, result} = case {1, "hello", :ok} do
  {1, x, _} -> {:ok, x}
  _ ->  {:error, "There is not match"}
end
IO.puts result


result = case {1, 2, 3, 4} do
  {_, x, 3, y} when x > 0 and y > 2 -> "Does match"
  _ -> "Does not match"
end
IO.puts result # prints: Does match


###########
result = case 1 do
  x when x < 0 -> "No match"
  x -> "Value #{x}"
end
IO.puts result # Value 1

result = case -21 do
  x when x < 0 -> "Value #{x}"
  x -> "No match"
end
IO.puts result # Value -21

result = case -1 do
  x -> "Value #{x}"
  x when x < 0 -> "No match"
end
IO.puts result

result = case 1 do
  a -> "Value #{a}"
  _ -> "No match"
end
IO.puts result
