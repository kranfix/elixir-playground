defmodule MyGuards do
  def info(dato) when dato == 1, do: "raiz cuadrada"
  def info(dato) when dato == 2, do: "Potencia"
  def info(dato) when dato == 3, do: "Inverso"
  def info(dato) when dato == 4, do: "Cuatro"

  def info2(dato) do
    cond do
      dato == 1 -> "raiz cuadrada"
      dato == 2 -> "Potencia"
      dato == 3 -> "Inverso"
      dato == 4 -> "Cuatro"
    end
  end
end

Enum.any?(1..10, fn x -> x == 2 end)
Enum.all?(1..10, fn x -> x < 20 end)
