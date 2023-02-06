defmodule VoltWeb.RsessionController do
  use VoltWeb, :controller
  import Plug.Conn

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"username" => username, "password" => password}}) do
    case Volt.Rauthentication.check_credentials(conn, username, password, repo: Volt.Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome #{username}")
        |> redirect(to: Routes.restaurantmain_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Bad credentials")
        |> render("new.html")
    end
  end


  def delete(conn, _params) do
    conn
    |> Volt.Rauthentication.logout
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
