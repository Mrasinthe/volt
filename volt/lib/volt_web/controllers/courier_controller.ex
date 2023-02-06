defmodule VoltWeb.CourierController do
  use VoltWeb, :controller

  alias Volt.Users
  alias Volt.Users.Courier

  def index(conn, _params) do
    couriers = Users.list_couriers()
    render(conn, "index.html", couriers: couriers)
  end

  def new(conn, _params) do
    changeset = Users.change_courier(%Courier{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"courier" => courier_params}) do
    case Users.create_courier(courier_params) do
      {:ok, courier} ->
        conn
        |> put_flash(:info, "Your account as Courier has been created successfully. Please login to continue!")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    courier = Users.get_courier!(id)
    render(conn, "show.html", courier: courier)
  end

  def edit(conn, %{"id" => id}) do
    courier = Users.get_courier!(id)
    changeset = Users.change_courier(courier)
    render(conn, "edit.html", courier: courier, changeset: changeset)
  end

  def update(conn, %{"id" => id, "courier" => courier_params}) do
    courier = Users.get_courier!(id)

    case Users.update_courier(courier, courier_params) do
      {:ok, courier} ->
        conn
        |> put_flash(:info, "Courier was updated successfully.")
        |> redirect(to: Routes.courier_path(conn, :show, courier))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", courier: courier, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    courier = Users.get_courier!(id)
    {:ok, _courier} = Users.delete_courier(courier)

    conn
    |> put_flash(:info, "Courier was deleted successfully.")
    |> redirect(to: Routes.courier_path(conn, :index))
  end
end
