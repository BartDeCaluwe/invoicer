defmodule InvoicerHealth.Router do
  use Plug.Router

  defmodule Health do
    use Plug.Router
    use NewRelic.Transaction

    plug(:match)
    plug(:dispatch)

    forward(
      "/",
      to: PlugCheckup,
      init_opts:
        PlugCheckup.Options.new(
          json_encoder: Jason,
          checks: InvoicerHealth.checks(),
          error_code: InvoicerHealth.error_code(),
          timeout: :timer.seconds(5),
          pretty: false
        )
    )
  end

  plug(:match)
  plug(:dispatch)

  forward("/health", to: Health)

  match(_, do: conn)
end
