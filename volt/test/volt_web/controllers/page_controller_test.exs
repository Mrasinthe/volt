defmodule VoltWeb.PageControllerTest do
  use VoltWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ ~r/Volt/i
  end
end
