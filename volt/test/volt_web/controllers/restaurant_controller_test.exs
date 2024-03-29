defmodule VoltWeb.RestaurantControllerTest do
  use VoltWeb.ConnCase

  import Volt.UsersFixtures

  @create_attrs %{address: "some address", email: "some_email@test.com", password: "some password", rname: "some rname", tag: "some tag", username: "some username"}
  @update_attrs %{address: "some updated address", email: "some_email@test.com", password: "some updated password", rname: "some updated rname", tag: "some updated tag", username: "some updated username"}
  @invalid_attrs %{address: nil, email: nil, password: nil, rname: nil, tag: nil, username: nil}

  describe "index" do
    test "lists all restaurants", %{conn: conn} do
      conn = get(conn, Routes.restaurant_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Restaurants"
    end
  end

  describe "new restaurant" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.restaurant_path(conn, :new))
      assert html_response(conn, 200) =~ "New Restaurant"
    end
  end

  describe "create restaurant" do
    test "redirects to login when data is valid", %{conn: conn} do
      conn = post(conn, Routes.restaurant_path(conn, :create), restaurant: @create_attrs)

      
      assert redirected_to(conn) == Routes.page_path(conn, :index)

      conn = get(conn, Routes.page_path(conn, :index))
      assert html_response(conn, 200) =~ ~r/Volt/i
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.restaurant_path(conn, :create), restaurant: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Restaurant"
    end
  end

  describe "edit restaurant" do
    setup [:create_restaurant]

    test "renders form for editing chosen restaurant", %{conn: conn, restaurant: restaurant} do
      conn = get(conn, Routes.restaurant_path(conn, :edit, restaurant))
      assert html_response(conn, 200) =~ "Edit Restaurant"
    end
  end

  describe "update restaurant" do
    setup [:create_restaurant]

    test "redirects when data is valid", %{conn: conn, restaurant: restaurant} do
      conn = put(conn, Routes.restaurant_path(conn, :update, restaurant), restaurant: @update_attrs)
      assert redirected_to(conn) == Routes.restaurant_path(conn, :show, restaurant)

      conn = get(conn, Routes.restaurant_path(conn, :show, restaurant))
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, restaurant: restaurant} do
      conn = put(conn, Routes.restaurant_path(conn, :update, restaurant), restaurant: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Restaurant"
    end
  end

  describe "delete restaurant" do
    setup [:create_restaurant]

    test "deletes chosen restaurant", %{conn: conn, restaurant: restaurant} do
      conn = delete(conn, Routes.restaurant_path(conn, :delete, restaurant))
      assert redirected_to(conn) == Routes.restaurant_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.restaurant_path(conn, :show, restaurant))
      end
    end
  end

  defp create_restaurant(_) do
    restaurant = restaurant_fixture()
    %{restaurant: restaurant}
  end
end
