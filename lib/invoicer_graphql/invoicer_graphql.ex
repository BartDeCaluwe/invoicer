defmodule InvoicerGraphQL do
  def document_providers(_) do
    [Absinthe.Plug.DocumentProvider.Default, InvoicerGraphQL.CompiledQueries]
  end
end
