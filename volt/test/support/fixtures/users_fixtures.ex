defmodule Volt.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Volt.Users` context.
  """

  @doc """
  Generate a restaurant.
  """
  def restaurant_fixture(attrs \\ %{}) do
    {:ok, restaurant} =
      attrs
      |> Enum.into(%{
        address: "some address",
        email: "some email",
        password: "some password",
        rname: "some rname",
        tag: "some tag",
        username: "some username"
      })
      |> Volt.Users.create_restaurant()

    restaurant
  end

  def courier_fixture(attrs \\ %{}) do
    {:ok, courier} =
      attrs
      |> Enum.into(%{
        name: "some name",
        surname: "some surname",
        username: "some username",
        date_of_birth: ~D[1995-05-05],
        email: "some_email@test.com",
        password: "some password",
      })
      |> Volt.Users.create_courier()

    courier
  end

  def customer_fixture(attrs \\ %{}) do
    {:ok, customer} =
      attrs
      |> Enum.into(%{
        name: "some name",
        surname: "some surname",
        date_of_birth: ~D[1995-05-05],
        email: "some_email@test.com",
        password: "some password",
        address: "some address",
        card_number: "1234567898746541"
      })
      |> Volt.Users.create_customer()

    customer
  end
end
