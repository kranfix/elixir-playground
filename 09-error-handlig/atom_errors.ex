readfile = fn filename ->
  case File.read(filename) do
    {:ok, data} -> IO.puts(data)
    {:error, reason} -> IO.puts("Error because of #{reason}")
  end
end

readfile.("atom_errors.e")
IO.puts("---------------------")
readfile.("atom_errors.ex")

# abstract class Result<T,E> {}
# class Ok<T, E> implements Result<T, E> {
#   T data
#   Ok(T data){
#     this.data = data;
#   }
# }
# class Error<T, E> implements Result<T, E> {
#   E err
#   Error(E err){
#     this.err = err;
#   }
# }
#
# Result<T,E> myFunction() {...}
#
# Let's imagine the following situation
# try do
#   {:ok, :erlang.read_file(filename)} # Ok(data)
# catch
#   e -> {:error, e} # Error(reason)
# end
