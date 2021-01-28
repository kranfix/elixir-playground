list = [a: 1, b: 2]
# [{:a, 1}, {:b, 2}]
IO.puts "a: #{list[:a]}, b: #{list[:b]}"
# list[index] Throws error

IO.puts list[:c] # nil

list = [a: 1, a: 1, b: 3, a: 2, b: 2]
IO.puts list[:a] # 1
IO.puts list[:b] # 3

IO.puts (list == [a: 1, b: 2]) # true
IO.puts (list == [{:a, 1}, {:b, 2}]) # true

list = [a: 1, b: 2]
IO.inspect (list ++ [c: 5]) # [a: 1, b: 2, c: 5]
IO.inspect (list ++ [1, 2]) # [{:a, 1}, {:b: 2}, 1, 2]

if(false, [do: "Truhty", else: "Falsy"]) # Falsy
if(true, [do: "Truhty", else: "Falsy"])  # Truhty

# Pattern Matching
[a: a] = [a: 1] # a = 1
# [x] = [{:a, 1}]
# x = {:a, 1}
# If x = [a: a], then:
# {:a, a} = {:a, 1}
# a = 1

[a: a] = [a: 1, b: 2] # Throws a MatchError
# [{:a, a}] = [{:a, 1}, {:b, 2}] # Different length

# [b: b, a: a] = [a: 1, b: 2] # Throws a MatchError

# Note:
# Enum(list, index) returns the a value in a index
