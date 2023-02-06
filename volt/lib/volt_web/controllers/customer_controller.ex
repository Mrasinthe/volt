defmodule VoltWeb.CustomerController do
  use VoltWeb, :controller

  alias Volt.Users
  alias Volt.Users.Customer

  def index(conn, _params) do
    customers = Users.list_customers()
    render(conn, "index.html", customers: customers)
  end

  def new(conn, _params) do
    changeset = Users.change_customer(%Customer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"customer" => customer_params}) do
    case Users.create_customer(customer_params) do
      {:ok, customer} ->
        conn
        |> put_flash(:info, "Your account has been created successfully. Please login to continue!")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    customer = Users.get_customer!(id)
    render(conn, "show.html", customer: customer)
  end

  def edit(conn, %{"id" => id}) do
    customer = Users.get_customer!(id)
    changeset = Users.change_customer(customer)
    render(conn, "edit.html", customer: customer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "customer" => customer_params}) do
    customer = Users.get_customer!(id)

    case Users.update_customer(customer, customer_params) do
      {:ok, customer} ->
        conn
        |> put_flash(:info, "Customer was updated successfully.")
        |> redirect(to: Routes.customer_path(conn, :show, customer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", customer: customer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    customer = Users.get_customer!(id)
    {:ok, _customer} = Users.delete_customer(customer)

    conn
    |> put_flash(:info, "Customer was deleted successfully.")
    |> redirect(to: Routes.customer_path(conn, :index))
  end
end
