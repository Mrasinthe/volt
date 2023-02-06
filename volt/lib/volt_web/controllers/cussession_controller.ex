defmodule VoltWeb.CussessionController do
  use VoltWeb, :controller
  import Plug.Conn

  def new(conn, _params) do
    render conn, "new.html"
  end


  def create(conn, %{"session" => %{"username" => username, "password" => password}}) do
    case Volt.Cusauthentication.checkCustomer_credentials(conn, username, password, repo: Volt.Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Hi #{username}")
        |> redirect(to: Routes.customermain_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Bad credentials")
        |> render("new.html")
    end
  end


  def delete(conn, _params) do
    conn
    |> Volt.Cusauthentication.logout
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
