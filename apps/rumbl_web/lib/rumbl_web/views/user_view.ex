defmodule RumblWeb.UserView do
  use RumblWeb, :view

  alias Rumbl.Accounts

  def first_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end

  def last_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(1)
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, username: user.username}
  end
end
