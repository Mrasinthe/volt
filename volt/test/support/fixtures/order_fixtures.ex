defmodule Volt.OrderFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Volt.Order` context.
  """

  @doc """
  Generate a orders.
  """
  def orders_fixture(attrs \\ %{}) do
    {:ok, orders} =
      attrs
      |> Enum.into(%{
        quantity: "some quantity"
      })
      |> Volt.Order.create_orders()

    orders
  end
end
