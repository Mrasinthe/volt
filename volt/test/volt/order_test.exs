defmodule Volt.OrderTest do
  use Volt.DataCase

  alias Volt.Order

  describe "orderitem" do
    alias Volt.Order.Orders

    import Volt.OrderFixtures

    @invalid_attrs %{quantity: nil}

    test "list_orderitem/0 returns all orderitem" do
      orders = orders_fixture()
      assert Order.list_orderitem() == [orders]
    end

    test "get_orders!/1 returns the orders with given id" do
      orders = orders_fixture()
      assert Order.get_orders!(orders.id) == orders
    end

    test "create_orders/1 with valid data creates a orders" do
      valid_attrs = %{quantity: "some quantity"}

      assert {:ok, %Orders{} = orders} = Order.create_orders(valid_attrs)
      assert orders.quantity == "some quantity"
    end

    test "create_orders/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Order.create_orders(@invalid_attrs)
    end

    test "update_orders/2 with valid data updates the orders" do
      orders = orders_fixture()
      update_attrs = %{quantity: "some updated quantity"}

      assert {:ok, %Orders{} = orders} = Order.update_orders(orders, update_attrs)
      assert orders.quantity == "some updated quantity"
    end

    test "update_orders/2 with invalid data returns error changeset" do
      orders = orders_fixture()
      assert {:error, %Ecto.Changeset{}} = Order.update_orders(orders, @invalid_attrs)
      assert orders == Order.get_orders!(orders.id)
    end

    test "delete_orders/1 deletes the orders" do
      orders = orders_fixture()
      assert {:ok, %Orders{}} = Order.delete_orders(orders)
      assert_raise Ecto.NoResultsError, fn -> Order.get_orders!(orders.id) end
    end

    test "change_orders/1 returns a orders changeset" do
      orders = orders_fixture()
      assert %Ecto.Changeset{} = Order.change_orders(orders)
    end
  end
end
