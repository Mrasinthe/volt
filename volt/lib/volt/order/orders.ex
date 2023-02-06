defmodule Volt.Order.Orders do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orderitem" do
    field :quantity, :string

    timestamps()
  end

  @doc false
  def changeset(orders, attrs) do
    orders
    |> cast(attrs, [:quantity])
    |> validate_required([:quantity])
  end
end
