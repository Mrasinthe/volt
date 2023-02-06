defmodule Volt.Users.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "restaurants" do
    field :address, :string
    field :email, :string
    field :password, :string
    field :rname, :string
    field :tag, :string
    field :username, :string
    has_many :item, Volt.Food.Item

    timestamps()
  end

  @doc false
  def changeset(restaurant, attrs) do
    restaurant
    |> cast(attrs, [:username, :rname, :email, :address, :password, :tag])
    |> validate_required([:username, :rname, :email, :address, :password, :tag])
    |> validate_length(:password, min: 5)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password,
        :crypto.hash(:md5, pass) |> Base.encode16())
      _ ->
        changeset
    end
end
end
