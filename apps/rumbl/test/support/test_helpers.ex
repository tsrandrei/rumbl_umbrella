defmodule Rumbl.TestHelpers do
  alias Rumbl.{Accounts, Multimedia}

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "Joe Armstrong",
        username: "user#{System.unique_integer([:positive])}",
        password: attrs[:password] || "supersecret"
        })
      |> Accounts.register_user()

    user
  end

  def video_fixture(%Accounts.User{} = user, attrs \\ %{}) do
    attrs =
      Enum.into(attrs, %{
        title: "The rise of Elixir",
        url: "http://erlixir-lang.org",
        description: "Elixir will dominate"
        })

    {:ok, video} = Multimedia.create(user, attrs)
  end
end
