import User

user =
  create_user()
  |> set_name("Frank", "Moreno")
  |> set_country("Peru")
  |> set_languages(["spanish", "english", "german"])

inspect(user) |> IO.puts()
