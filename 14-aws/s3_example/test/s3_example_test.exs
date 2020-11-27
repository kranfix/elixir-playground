defmodule S3ExampleTest do
  use ExUnit.Case
  doctest S3Example

  test "greets the world" do
    assert S3Example.hello() == :world
  end
end
