defmodule Volt.Users.Courier do
  use Ecto.Schema
  import Ecto.Changeset

  schema "couriers" do
    field :name, :string
    field :surname, :string
    field :username, :string
    field :date_of_birth, :date
    field :email, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(courier, attrs) do
    courier
    |> cast(attrs, [:name, :surname, :username, :date_of_birth, :email, :password])
    |> validate_required([:name, :username, :email, :password])
    |> validate_format(:email, ~r/^[\w.!#$%&’*+\-\/=?\^`{|}~]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*$/i)
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
