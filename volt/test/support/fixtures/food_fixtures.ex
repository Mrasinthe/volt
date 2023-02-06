defmodule Volt.FoodFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Volt.Food` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        price: "some price",
        restaurantId: "some restaurantId",
        status: "some status"
      })
      |> Volt.Food.create_item()

    item
  end
end
