defmodule Volt.RestaurantTest do
  use Volt.DataCase

  alias Volt.Users

  describe "restaurants" do
    alias Volt.Users.Restaurant

    import Volt.UsersFixtures

    @invalid_attrs %{address: nil, email: nil, password: nil, rname: nil, tag: nil, username: nil}

    test "list_restaurants/0 returns all restaurants" do
      restaurant = restaurant_fixture()
      assert Users.list_restaurants() == [restaurant]
    end

    test "get_restaurant!/1 returns the restaurant with given id" do
      restaurant = restaurant_fixture()
      assert Users.get_restaurant!(restaurant.id) == restaurant
    end

    test "create_restaurant/1 with valid data creates a restaurant" do
      valid_attrs = %{address: "some address", email: "some_email@test.com", password: "some password", rname: "some rname", tag: "some tag", username: "some username"}

      assert {:ok, %Restaurant{} = restaurant} = Users.create_restaurant(valid_attrs)
      assert restaurant.address == "some address"
      assert restaurant.email == "some_email@test.com"
      assert restaurant.password != "some password"
      assert restaurant.rname == "some rname"
      assert restaurant.tag == "some tag"
      assert restaurant.username == "some username"
    end

    test "create_restaurant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_restaurant(@invalid_attrs)
    end

    test "update_restaurant/2 with valid data updates the restaurant" do
      restaurant = restaurant_fixture()
      update_attrs = %{address: "some updated address", email: "some_email@test.com", password: "some updated password", rname: "some updated rname", tag: "some updated tag", username: "some updated username"}

      assert {:ok, %Restaurant{} = restaurant} = Users.update_restaurant(restaurant, update_attrs)
      assert restaurant.address == "some updated address"
      assert restaurant.email == "some_email@test.com"
      assert restaurant.password != "some updated password"
      assert restaurant.rname == "some updated rname"
      assert restaurant.tag == "some updated tag"
      assert restaurant.username == "some updated username"
    end

    test "update_restaurant/2 with invalid data returns error changeset" do
      restaurant = restaurant_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_restaurant(restaurant, @invalid_attrs)
      assert restaurant == Users.get_restaurant!(restaurant.id)
    end

    test "delete_restaurant/1 deletes the restaurant" do
      restaurant = restaurant_fixture()
      assert {:ok, %Restaurant{}} = Users.delete_restaurant(restaurant)
      assert_raise Ecto.NoResultsError, fn -> Users.get_restaurant!(restaurant.id) end
    end

    test "change_restaurant/1 returns a restaurant changeset" do
      restaurant = restaurant_fixture()
      assert %Ecto.Changeset{} = Users.change_restaurant(restaurant)
    end
  end
end
