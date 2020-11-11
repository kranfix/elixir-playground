defmodule Shape do
  defmodule Circle do
    @enforce_keys [:radius]
    defstruct [:radius]

    def create(radius) when is_number(radius) and radius > 0 do
      %Circle{radius: radius}
    end

    def create(%{diameter: d}) when d != nil do
      create(d / 2)
    end

    def create(%{radius: r}) do
      create(r)
    end

    def perimeter(circle) when circle.__struct__ == Circle do
      2 * circle.radius * :math.pi()
    end

    def area(circle) when circle.__struct__ == Circle do
      :math.pi() * circle.radius * circle.radius
    end
  end

  defmodule Rectangle do
    @enforce_keys [:width, :height]
    defstruct [:width, :height]

    defguard is_positive(n) when is_number(n) and n > 0

    def create(w, h) when is_positive(w) and is_positive(h) do
      %Rectangle{width: w, height: h}
    end

    def perimeter(rect) when rect.__struct__ == Rectangle do
      2 * (rect.width + rect.height)
    end

    def area(rect) when rect.__struct__ == Rectangle do
      rect.width * rect.height
    end
  end

  def create(:circle, map) when map != nil do
    Circle.create(map)
  end

  def create(:rectangle, %{width: w, height: h}) do
    Rectangle.create(w, h)
  end

  def create(:square, %{size: s}) do
    Rectangle.create(s, s)
  end

  def perimeter(circle) when circle.__struct__ == Circle do
    Circle.perimeter(circle)
  end

  def perimeter(rectangle) when rectangle.__struct__ == Rectangle do
    Rectangle.perimeter(rectangle)
  end

  def area(circle) when circle.__struct__ == Circle do
    Circle.area(circle)
  end

  def area(rectangle) when rectangle.__struct__ == Rectangle do
    Rectangle.area(rectangle)
  end
end
