defmodule InvoicerGraphQL.Router do
  use Plug.Router

  defmodule GraphQL do
    use Plug.Router
    use NewRelic.Transaction

    plug(:match)
    plug(:dispatch)

    forward("/",
      to: Absinthe.Plug,
      init_opts: [
        document_providers: {InvoicerGraphQL, :document_providers},
        json_codec: Jason,
        schema: InvoicerGraphQL.Schema
      ]
    )
  end

  plug(InvoicerGraphQL.Plugs.Context)

  plug(:match)
  plug(:dispatch)

  forward("/graphql", to: GraphQL)

  match(_, do: conn)
end
