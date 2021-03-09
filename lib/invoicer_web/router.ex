defmodule InvoicerWeb.Router do
  use Phoenix.Router

  pipeline :browser do
    plug(:accepts, ["html", "json"])

    plug(:session)
    plug(:fetch_session)
    plug(:fetch_flash)

    plug(:protect_from_forgery)
    plug(InvoicerWeb.ContentSecurityPolicy)

    plug(:put_layout, {InvoicerWeb.Layouts.View, :app})

    plug(NewRelic.Transaction.Plug)
    plug(NewRelic.Phoenix.Transaction.Plug)
    plug(NewRelic.DistributedTrace.Plug)
  end

  scope "/", InvoicerWeb do
    pipe_through(:browser)

    get("/", Home.Controller, :index, as: :home)
  end

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  defp session(conn, _opts) do
    opts =
      Plug.Session.init(
        store: :cookie,
        key: Application.get_env(:invoicer, __MODULE__)[:session_key],
        signing_salt: Application.get_env(:invoicer, __MODULE__)[:session_signing_salt]
      )

    Plug.Session.call(conn, opts)
  end
end