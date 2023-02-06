defmodule VoltWeb.OrdersControllerTest do
  use VoltWeb.ConnCase

  import Volt.OrderFixtures

  @create_attrs %{quantity: "some quantity"}
  @update_attrs %{quantity: "some updated quantity"}
  @invalid_attrs %{quantity: nil}

  describe "index" do
    test "lists all orderitem", %{conn: conn} do
      conn = get(conn, Routes.orders_path(conn, :index))
      assert html_response(conn, 200) =~ "MENU"
    end

  end

  describe "new orders" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.orders_path(conn, :new))
      assert html_response(conn, 200) =~ "New Orders"
    end
  end

  describe "create orders" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.orders_path(conn, :create), orders: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.orders_path(conn, :show, id)

      conn = get(conn, Routes.orders_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Orders"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.orders_path(conn, :create), orders: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Orders"
    end
  end

  describe "edit orders" do
    setup [:create_orders]

    test "renders form for editing chosen orders", %{conn: conn, orders: orders} do
      conn = get(conn, Routes.orders_path(conn, :edit, orders))
      assert html_response(conn, 200) =~ "Edit Orders"
    end
  end

  describe "update orders" do
    setup [:create_orders]

    test "redirects when data is valid", %{conn: conn, orders: orders} do
      conn = put(conn, Routes.orders_path(conn, :update, orders), orders: @update_attrs)
      assert redirected_to(conn) == Routes.orders_path(conn, :show, orders)

      conn = get(conn, Routes.orders_path(conn, :show, orders))
      assert html_response(conn, 200) =~ "some updated quantity"
    end

    test "renders errors when data is invalid", %{conn: conn, orders: orders} do
      conn = put(conn, Routes.orders_path(conn, :update, orders), orders: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Orders"
    end
  end

  describe "delete orders" do
    setup [:create_orders]

    test "deletes chosen orders", %{conn: conn, orders: orders} do
      conn = delete(conn, Routes.orders_path(conn, :delete, orders))
      assert redirected_to(conn) == Routes.orders_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.orders_path(conn, :show, orders))
      end
    end
  end

  defp create_orders(_) do
    orders = orders_fixture()
    %{orders: orders}
  end
end
