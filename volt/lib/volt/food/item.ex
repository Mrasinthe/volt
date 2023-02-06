defmodule Volt.Food.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :description, :string
    field :name, :string
    field :price, :string
    field :status, :string
    belongs_to :restaurant, Volt.Users.Restaurant

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :description, :price, :status])
    |> validate_required([:name, :description, :price, :status])
  end
end
