defmodule VoltWeb.OrdersController do
  use VoltWeb, :controller

  alias Volt.Order
  alias Volt.Order.Orders
  alias Volt.Users.Restaurant
  alias Volt.Food
  alias Volt.Food.Item
  alias Volt.Repo

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    orderitem = Food.list_items()
    render(conn, "index.html", orderitem: orderitem)
  end

  def new(conn, _params) do
    changeset = Order.change_orders(%Orders{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"orders" => orders_params}) do
    case Order.create_orders(orders_params) do
      {:ok, orders} ->
        conn
        |> put_flash(:info, "Order created successfully.")
        |> redirect(to: Routes.orders_path(conn, :show, orders))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    orders = Order.get_orders!(id)
    render(conn, "show.html", orders: orders)
  end

  def edit(conn, %{"id" => id}) do
    orders = Order.get_orders!(id)
    changeset = Order.change_orders(orders)
    render(conn, "edit.html", orders: orders, changeset: changeset)
  end

  def update(conn, %{"id" => id, "orders" => orders_params}) do
    orders = Order.get_orders!(id)

    case Order.update_orders(orders, orders_params) do
      {:ok, orders} ->
        conn
        |> put_flash(:info, "Orders updated successfully.")
        |> redirect(to: Routes.orders_path(conn, :show, orders))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", orders: orders, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    orders = Order.get_orders!(id)
    {:ok, _orders} = Order.delete_orders(orders)

    conn
    |> put_flash(:info, "Orders deleted successfully.")
    |> redirect(to: Routes.orders_path(conn, :index))
  end
end
