defmodule HelloWeb.HolaController do
  use HelloWeb, :controller

  def hola(conn, _params) do
    IO.inspect(conn)
    render(conn, "hola.html")
  end
end
