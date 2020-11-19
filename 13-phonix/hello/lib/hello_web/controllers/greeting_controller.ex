defmodule HelloWeb.GreetingController do
  use HelloWeb, :controller

  def say_hello(conn, _params) do
    "Hola!"
  end
end
