defmodule VoltWeb.CourierControllerTest do
  use VoltWeb.ConnCase

  import Volt.UsersFixtures

  @create_attrs %{name: "some name", surname: "some surname", username: "some username", date_of_birth: ~D[1995-05-05], email: "some_email@test.com", password: "some password"}
  @update_attrs %{name: "some U name", surname: "some U surname", username: "some U username", date_of_birth: ~D[1995-07-05], email: "some_email_u@test.com", password: "some U password"}
  @invalid_attrs %{name: nil, email: nil, password: nil, username: nil}

  describe "index" do
    test "lists all couriers", %{conn: conn} do
      conn = get(conn, Routes.courier_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Couriers"
    end
  end

  describe "new courier" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.courier_path(conn, :new))
      assert html_response(conn, 200) =~ "New Courier"
    end
  end

  describe "create courier" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.courier_path(conn, :create), courier: @create_attrs)

      assert redirected_to(conn) == Routes.page_path(conn, :index)

      conn = get(conn, Routes.page_path(conn, :index))
      assert html_response(conn, 200) =~ ~r/Volt/i
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.courier_path(conn, :create), courier: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Courier"
    end
  end

  describe "edit courier" do
    setup [:create_courier]

    test "renders form for editing chosen courier", %{conn: conn, courier: courier} do
      conn = get(conn, Routes.courier_path(conn, :edit, courier))
      assert html_response(conn, 200) =~ "Edit Courier"
    end
  end

  describe "update courier" do
    setup [:create_courier]

    test "redirects when data is valid", %{conn: conn, courier: courier} do
      conn = put(conn, Routes.courier_path(conn, :update, courier), courier: @update_attrs)
      assert redirected_to(conn) == Routes.courier_path(conn, :show, courier)

      conn = get(conn, Routes.courier_path(conn, :show, courier))
      assert html_response(conn, 200) =~ "some U name"
    end

    test "renders errors when data is invalid", %{conn: conn, courier: courier} do
      conn = put(conn, Routes.courier_path(conn, :update, courier), courier: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Courier"
    end
  end

  describe "delete courier" do
    setup [:create_courier]

    test "deletes chosen courier", %{conn: conn, courier: courier} do
      conn = delete(conn, Routes.courier_path(conn, :delete, courier))
      assert redirected_to(conn) == Routes.courier_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.courier_path(conn, :show, courier))
      end
    end
  end

  defp create_courier(_) do
    courier = courier_fixture()
    %{courier: courier}
  end
end
