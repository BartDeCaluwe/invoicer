defmodule Invoicer.Application do
  @moduledoc """
  Main entry point of the app
  """

  use Application

  def start(_type, _args) do
    children = [
      Invoicer.Repo,
      {Phoenix.PubSub, [name: Invoicer.PubSub, adapter: Phoenix.PubSub.PG2]},
      InvoicerWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Invoicer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    InvoicerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
