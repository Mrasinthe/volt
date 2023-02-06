defmodule Volt.Rauthentication do
  import Plug.Conn

  def init(opts) do
    opts[:repo]
  end

  def call(conn, repo) do
    user_id = get_session(conn, :restaurant_id)
    user = user_id && repo.get(Volt.Users.Restaurant, user_id)
    login(conn, user_id, user)
  end

  def login(conn, user_id, user) do
    assign(conn, :current_user, user)
    |> put_session(:restaurant_id, user_id)
  end

  def logout(conn) do
    configure_session(conn, drop: true)
  end

  def check_credentials(conn, username, password, [repo: repo]) do
    user = repo.get_by(Volt.Users.Restaurant, username: username)
    if user && user.password == password do
      {:ok, login(conn, user.id, user)}
    else
      {:error, :unauthorized, conn}
    end
  end

end
