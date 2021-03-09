defmodule InvoicerWeb.HealthTest do
  use InvoicerWeb.ConnCase

  test "GET /health", %{conn: conn} do
    conn = get(conn, "/health")

    assert response(conn, 200)
  end
end
