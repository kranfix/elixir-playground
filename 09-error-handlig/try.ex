IO.puts("SECTION 1 -----------------")

try do
  :bar / 2
rescue
  RuntimeError -> IO.puts("There was a runtime error")
  ArithmeticError -> IO.puts("The disivions was not possible")
end

IO.puts("SECTION 2 -----------------")

try do
  :bar / 2
rescue
  RuntimeError -> IO.puts("There was a runtime error")
  e in ArithmeticError -> IO.puts("The disivions was not possible: #{e.message}")
end

IO.puts("SECTION 3 -----------------")

try do
  raise CustomError, message: "My custom error"
rescue
  e in CustomError -> IO.puts("message: #{e.message}, country: #{e.country}")
end

try do
  raise CustomError, message: "My custom error", country: "Colombia"
rescue
  e in CustomError -> IO.puts("message: #{e.message}, country: #{e.country}")
end

IO.puts("SECTION 4 -----------------")

try do
  IO.puts("This is not an error")
rescue
  _ -> IO.puts("This is never printed")
after
  IO.puts("This is always printed?")
end

try do
  raise "There was an erro :'("
rescue
  _ -> IO.puts("This is never printed")
after
  IO.puts("This is always printed?")
end

IO.puts("SECTION 5 -----------------")

try do
  IO.puts("This is not an error")
catch
  e -> IO.puts("This is never printed #{e}")
after
  IO.puts("This is always printed?")
end

try do
  throw(453_637)
  IO.puts("This is never printed")
catch
  e -> IO.puts("This a catch: #{e}")
after
  IO.puts("This is always printed?")
end

IO.puts("SECTION 6 -----------------")

try do
  raise "hola"
  IO.puts("This is never printed")
rescue
  e -> IO.puts("From rescue: #{e.message}")
catch
  e -> IO.puts("From catch: #{e}")
after
  IO.puts("This is always printed?")
end

try do
  throw("hola")
  IO.puts("This is never printed")
rescue
  e -> IO.puts("From rescue: #{e.message}")
catch
  e -> IO.puts("From catch: #{e}")
after
  IO.puts("This is always printed?")
end

IO.puts("SECTION 7 -----------------")

try do
  throw(nil)
  IO.puts("This is never printed")
rescue
  e -> IO.puts("From rescue: #{e.message}")
catch
  e -> IO.puts("From catch: #{e}")
after
  IO.puts("This is always printed?")
end

IO.puts("SECTION 8 -----------------")

try do
  0..20
  |> Enum.each(fn x ->
    if x == 10, do: raise("Oops! x == 10")
  end)
rescue
  e -> IO.puts("From rescue: #{e.message}")
catch
  e -> IO.puts("From catch: #{e}")
after
  IO.puts("This is always printed?")
end

try do
  0..20
  |> Enum.each(fn x ->
    if x == 10, do: throw("Oops!")
  end)
rescue
  e -> IO.puts("From rescue: #{e.message}")
catch
  e -> IO.puts("From catch: #{e}")
after
  IO.puts("This is always printed?")
end
