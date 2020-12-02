defmodule AuthServiceTest do
  use ExUnit.Case
  doctest AuthService

  defmodule Mock do
    defstruct [:id]

    defimpl AuthService do
      def readUser(service, id) do
        %User{
          avatar: "https://reqres.in/img/faces/2-image.jpg",
          email: "james.mock@reqres.ex",
          id: 1,
          job: nil,
          name: "James Mock"
        }
      end
    end
  end

  test "Default Mock creation" do
    assert %Mock{}.id == nil
  end

  test "greets the world" do
    user = AuthService.readUser(%Mock{}, 1)
    assert user.name == "James Mock"
  end
end
