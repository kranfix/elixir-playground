defmodule Shape.RectangleTest do
  use ExUnit.Case
  doctest Shape.Rectangle

  alias Shape.Rectangle

  test "is_positive must work" do
    assert !Rectangle.is_positive(nil)
    assert !Rectangle.is_positive(-2)
    assert !Rectangle.is_positive(0)
    assert Rectangle.is_positive(3.0)
  end

  test "Creates rectangle struct" do
    rect = %Rectangle{width: nil, height: nil}
    assert rect.width == nil
    assert rect.height == nil
  end

  test "Creates a rectangle with nil width and height" do
    try do
      Rectangle.create(nil, nil)
      raise "Rectangle width must be non-nil"
    rescue
      FunctionClauseError -> nil
    end

    try do
      Rectangle.create(3, nil)
      raise "Rectangle height must be non-nil"
    rescue
      FunctionClauseError -> nil
    end

    try do
      Rectangle.create(-3, -4)
      raise "Rectangle width must be positive"
    rescue
      FunctionClauseError -> nil
    end

    try do
      Rectangle.create(3, -4)
      raise "Rectangle height must be positive"
    rescue
      FunctionClauseError -> nil
    end
  end

  test "Creates a rectangle from width and height" do
    rect = Rectangle.create(3, 4)
    assert Rectangle.perimeter(rect) == 14
    assert Rectangle.area(rect) == 12
  end
end
