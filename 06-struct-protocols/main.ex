alias Geometry.Rectangle
alias Geometry.Circle
alias Geometry.Shape

IO.puts(Shape.area(%Rectangle{b: 3, h: 4}))
IO.puts(Shape.perimeter(%Rectangle{b: 3, h: 4}))
IO.puts(Shape.area(%Circle{}))
IO.puts(Shape.perimeter(%Circle{}))
IO.puts(Shape.area("hola"))
