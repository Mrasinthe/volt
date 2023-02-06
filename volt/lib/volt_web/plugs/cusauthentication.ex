defmodule Volt.Cusauthentication do
  import Plug.Conn

  def init(opts) do
    opts[:repo]
  end

  def call(conn, repo) do
    user_id = get_session(conn, :customer_id)
    user = user_id && repo.get(Volt.Users.Customer, user_id)
    login(conn, user_id, user)
  end

  def login(conn, user_id, user) do
    assign(conn, :currentCustomer_user, user)
    |> put_session(:customer_id, user_id)
  end

  def logout(conn) do
    configure_session(conn, drop: true)
  end

  def checkCustomer_credentials(conn, username, password, [repo: repo]) do
    user = repo.get_by(Volt.Users.Customer, name: username)
    if user && user.password == password do
      {:ok, login(conn, user.id, user)}
    else
      {:error, :unauthorized, conn}
    end
  end

end
