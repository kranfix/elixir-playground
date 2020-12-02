defprotocol AuthService do
  def readUser(service, id)
  # def createUser(service, name, job)
  # def updateUser(service, name, job)
end

defmodule Reqres do
  defstruct url: "https://reqres.in"

  defimpl AuthService, for: Reqres do
    def readUser(service, id) do
      Reqres.readUser(service, id)
    end

    # def createUser(service, name, job) do
    #  body = HTTPoison.get!("#{@url}/api/users/2")
    #  User.from(body)
    # end

    # def updateUser(service, name, job) do
    # end
  end

  def readUser(http, id) do
    response = HTTPoison.get!("#{http.url}/api/users/#{id}")
    map = JSON.decode!(response.body)
    User.from(map["data"])
  end
end

defmodule User do
  defstruct [:id, :email, :name, :job, :avatar]

  def from(map) when is_map(map) do
    %User{
      id: map["id"],
      email: map["email"],
      name: "#{map["first_name"]} #{map["last_name"]}",
      avatar: map["avatar"]
    }
  end

  def from(json) when is_binary(json) do
    json |> JSON.decode!() |> from()
  end

  def update(user, name, job) do
    %{user | name: name, job: job}
  end
end
