defmodule Volt.FoodTest do
  use Volt.DataCase

  alias Volt.Food

  describe "items" do
    alias Volt.Food.Item

    import Volt.FoodFixtures

    @invalid_attrs %{description: nil, name: nil, price: nil, status: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Food.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Food.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{description: "some description", name: "some name", price: "some price", status: "some status"}

      assert {:ok, %Item{} = item} = Food.create_item(valid_attrs)
      assert item.description == "some description"
      assert item.name == "some name"
      assert item.price == "some price"
      assert item.status == "some status"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Food.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name", price: "some updated price", status: "some updated status"}

      assert {:ok, %Item{} = item} = Food.update_item(item, update_attrs)
      assert item.description == "some updated description"
      assert item.name == "some updated name"
      assert item.price == "some updated price"
      assert item.status == "some updated status"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Food.update_item(item, @invalid_attrs)
      assert item == Food.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Food.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Food.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Food.change_item(item)
    end
  end
end
