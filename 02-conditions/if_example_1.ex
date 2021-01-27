# result = cond do
#   true -> "this return a value"
# end
result = if true do
  "this return a value"
end
IO.puts result # this return a value

# result = cond do
#   my_condition -> "this return a value"
#   true -> nil
# end
result = if false do
  "this return a value"
#else
#  nil
end
IO.puts result # this return a value

#evaluateIf = fn x ->
#  if x do
#    "Truhty"
#  else
#    "Falsy"
#  end
#end
evaluateIf = fn x ->
  if x, do: "Truhty", else: "Falsy"
end

evaluateIf.(false) # Falsy
evaluateIf.(nil) # Falsy
# evaluate.( another_value ) # Truhty # for more example, watch cond examples
