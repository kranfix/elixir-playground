# Integers
n = 102
n_hex = 0x41 # = 65
n_octal = 0o24 # = 20

IO.puts("a = #{n},   b = #{n_hex},   c = #{n_octal}")

q = div(35, 4) # 8
r = rem(35, 4) # 3

IO.puts("div(35, 4) = #{q}")
IO.puts("rem(35, 4) = #{r}")

# Float
IO.puts("============================")
x = 2.71
IO.puts("round(#{x}) = #{round(x)}")
IO.puts("trunc(#{x}) = #{trunc(x)}")

x = 276.5e-2
IO.puts("round(#{x}) = #{round(x)}")
IO.puts("trunc(#{x}) = #{trunc(x)}")

# Numbers (Integers and Floats)
IO.puts "(1 == 1.0) = #{1 == 1.0}"
IO.puts "(1 != 1.0) = #{1 != 1.0}"
IO.puts "(1 === 1.0) = #{1 === 1.0}"
IO.puts "(1 !== 1.0) = #{1 !== 1.0}"
IO.puts "(1.0 < 2) = #{1.0 < 2}"
IO.puts "(1.0 <= 2) = #{1.0 <= 2}"
IO.puts "(2.0 <= 2) = #{2.0 <= 2}"
IO.puts "(1.0 > 2) = #{1.0 > 2}"
IO.puts "(1.0 >= 2) = #{1.0 >= 2}"
IO.puts "(2.0 >= 2) = #{2.0 >= 2}"


# Booleans
IO.puts("============================")
t = true
f = false

IO.puts("AND table")
IO.puts("#{f} and #{f} = #{f and f}")
IO.puts("#{f} and #{t} = #{f and t}")
IO.puts("#{t} and #{f} = #{t and f}")
IO.puts("#{t} and #{t} = #{t and t}")
IO.puts("--------------------------")
IO.puts("OR table")
IO.puts("#{f} or #{f} = #{f or f}")
IO.puts("#{f} or #{t} = #{f or t}")
IO.puts("#{t} or #{f} = #{t or f}")
IO.puts("#{t} or #{t} = #{t or t}")
IO.puts("--------------------------")
IO.puts("OR table")
IO.puts("not #{f} = #{not f}")
IO.puts("not #{t} = #{not t}")
IO.puts("--------------------------")
IO.puts("is_boolean(#{t}) = #{is_boolean(t)}")
IO.puts("is_boolean(#{f}) = #{is_boolean(f)}")
IO.puts("is_boolean(#{f}) = #{is_boolean(1.2)}")
IO.puts("--------------------------")
a = 2
b = 1.5
IO.puts("is_float(#{a}) = #{is_float(a)}")
IO.puts("is_float(#{b}) = #{is_float(b)}")
IO.puts("is_integer(#{a}) = #{is_integer(a)}")
IO.puts("is_integer(#{b}) = #{is_integer(b)}")
IO.puts("is_number(#{a}) = #{is_number(a)}")
IO.puts("is_number(#{b}) = #{is_number(b)}")


IO.puts("============================")
text = "Pingüino"
IO.puts(text)
IO.puts("is_binary(\"#{text}\") = #{is_binary(text)}")
n = String.length(text)
IO.puts("is_binary(#{n}) = #{is_binary(n)}")
IO.puts("String.length(\"#{text}\") = #{n}")
IO.puts("byte_size(\"#{text}\") = #{byte_size(text)}")

IO.puts String.upcase(text)

IO.puts("============================")
atom = :my_atom
atom2 = MyAtom
IO.puts "is_atom(4) = #{is_atom(4)}"
IO.puts "is_atom(#{atom}) = #{is_atom(atom)}"
IO.puts("is_boolean(#{atom}) = #{is_boolean(atom)}")
IO.puts "is_atom(#{atom2}) = #{is_atom(atom2)}"
IO.puts("is_boolean(#{atom2}) = #{is_boolean(atom2)}")

t = true
f = false
IO.puts "is_atom(#{t}) = #{is_atom(t)}"
IO.puts "is_atom(#{f}) = #{is_atom(f)}"
IO.puts "(:true == true) = #{:true == true}"
IO.puts "(:false == false) = #{:false == false}"

IO.puts("#{:ok}")
IO.puts("#{:error}")

IO.puts("============================")
add = fn (x, y) ->
  x + y
end

sub = fn x, y -> x - y end

s = add.(1,2)
r = sub.(5, 3)

# IO.puts("#{add}") # Throws an error. "add" can not be formatted as string
IO.puts("is_function(add) = #{is_function(add)}")
IO.puts("is_function(sub) = #{is_function(sub)}")
IO.puts("add.(1, 2) = #{s}")
IO.puts("sub.(5, 3) = #{r}")
IO.puts("is_function(add, 0) = #{is_function(add, 0)}")
IO.puts("is_function(add, 1) = #{is_function(add, 1)}")
IO.puts("is_function(add, 2) = #{is_function(add, 2)}")
IO.puts("is_function(add, 3) = #{is_function(add, 3)}")

double = fn x -> add.(x, x) end
IO.puts("double.(5) = #{double.(5)}")

five = (fn x -> x + 1 end).(4)
IO.puts("five = #{five}")

IO.puts("============================")
list = [1, "hola", 2.3, false]
# IO.puts("list = #{list}") # A List can not be printed
IO.inspect list
IO.puts("length(list) = #{length list}")

list = [1, "hola"] ++ [4,"y", :hello]
IO.inspect list
IO.puts("length(list) = #{length list}")

IO.puts "hd(list) = #{hd(list)}"
IO.puts "tl(list) = "
IO.inspect tl(list)
# hd [] # ** (ArgumentError) argument error
# tl [] # ** (ArgumentError) argument error

IO.puts("--------------------------")
a = [1,4,2,3,7,5,6,9,3, 2, 8]
b = [3, 2, 20, 5]
IO.puts "a -- b ="
IO.inspect a -- b

IO.puts("--------------------------")
IO.puts "4 in [3, 4] #{4 in [3, 4]}"
IO.puts "4 not in [3, 4] #{4 not in [3, 4]}"
IO.puts "5 in [3, 4] #{5 in [3, 4]}"
IO.puts "5 not in [3, 4] #{5 not in [3, 4]}"

# iex(3)> [64,65]
# '@A'
# iex(4)> [11,12, 13]
# '\v\f\r'
# iex(5)> [104, 111, 108, 97]
# 'hola'

IO.puts("============================")
tuple = {1, "4", 3.0, true, :error}
IO.inspect tuple

{a, b, _, c, _} = tuple
IO.puts("a = #{a},   b = #{b},   c = #{c}")

IO.inspect put_elem(tuple, 2, :ok)
IO.inspect tuple

result = File.read("01-hello-world/hello.ex")
IO.inspect result
IO.puts "elem(result, 0) = #{elem(result, 0)}"

result = File.read("hello.ex")
IO.inspect result
IO.puts "elem(result, 0) = #{elem(result, 0)}"
