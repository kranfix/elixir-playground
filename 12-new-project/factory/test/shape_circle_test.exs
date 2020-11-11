defmodule Shape.CircleTest do
  use ExUnit.Case
  doctest Shape.Circle

  alias Shape.Circle

  test "Creates a circle and calculates its area and perimeter" do
    circle = %Circle{radius: 3}
    assert circle.radius == 3
    assert Circle.perimeter(circle) == 6 * :math.pi()
    assert Circle.area(circle) == 9 * :math.pi()
  end

  test "Circle must have a non-nil radius" do
    circle = %Circle{radius: nil}
    assert circle.radius == nil
  end

  test "Creates cirle with create method" do
    try do
      Circle.create(nil)
      raise "The raidus must be non-nil"
    rescue
      FunctionClauseError -> nil
    end

    try do
      Circle.create(-2)
      raise "The raidus must be positive"
    rescue
      FunctionClauseError -> nil
    end

    try do
      Circle.create(0)
      raise "The raidus must be greater than zero"
    rescue
      FunctionClauseError -> nil
    end

    circle = Circle.create(1.5)
    assert circle.radius == 1.5
  end

  test "Creates a circle from diameter" do
    circle = Circle.create(%{diameter: 10})
    assert Shape.perimeter(circle) == 10 * :math.pi()
    assert Shape.area(circle) == 25 * :math.pi()
  end

  test "Creates a circle from radius" do
    circle = Circle.create(%{radius: 5})
    assert Shape.perimeter(circle) == 10 * :math.pi()
    assert Shape.area(circle) == 25 * :math.pi()
  end
end
