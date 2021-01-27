result = unless true do
  "this never will be returned"
end
IO.puts result # nil

# result = cond do
#   my_condition -> nil
#   true -> "this return a value"
# end
result = unless false do
  "this return a value"
#else
#  nil
end
IO.puts result # this return a value

#evaluateUnless = fn x ->
#  unless x do
#    "Truhty"
#  else
#    "falsy"
#  end
#end
evaluateUnless = fn x ->
  unless x, do: "Truhty", else: "Falsy"
end

evaluateUnless.(false) # Truhty
evaluateUnless.(nil) # Truhty
# evaluateUnless.( another_value ) # Falsy # for more example, watch cond examples
