defmodule CustomError do
  defexception [:message, country: "Peru"]
end

defmodule DefaultError do
  defexception message: "My default Error"
end

# iex> raise CustomError
# iex> raise DefaultError
# iex> raise DefaultError, message: "Not my default error"
