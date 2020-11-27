defmodule Chirp.Timeline.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field(:body, :string)
    field(:like_count, :integer, default: 0)
    field(:reports_count, :integer, default: 0)
    field(:username, :string, default: "kranfix")

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    # |> cast(attrs, [:username, :body, :like_count, :reports_count])
    |> cast(attrs, [:body])
    |> validate_required([:body])
    |> validate_length(:body, min: 2, max: 280)
  end
end
