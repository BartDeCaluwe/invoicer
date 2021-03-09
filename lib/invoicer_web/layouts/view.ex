defmodule InvoicerWeb.Layouts.View do
  use Phoenix.View, root: "lib/invoicer_web", path: "layouts/templates", namespace: InvoicerWeb
  use Phoenix.HTML

  import Phoenix.Controller, only: [get_flash: 2]

  alias InvoicerWeb.Router.Helpers, as: Routes
end
