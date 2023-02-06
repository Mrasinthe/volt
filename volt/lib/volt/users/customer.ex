defmodule Volt.Users.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :name, :string
    field :surname, :string
    field :date_of_birth, :date
    field :email, :string
    field :password, :string
    field :address, :string
    field :card_number, :string

    timestamps()
  end

  @doc false
  def changeset(courier, attrs) do
    courier
    |> cast(attrs, [:name, :surname, :date_of_birth, :email, :password, :address, :card_number])
    |> validate_required([:name, :email, :password, :address, :card_number])
    |> validate_format(:email, ~r/^[\w.!#$%&’*+\-\/=?\^`{|}~]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*$/i)
    |> validate_format(:card_number, ~r/^[0-9]{16}$/i)
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
