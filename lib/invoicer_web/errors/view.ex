defmodule InvoicerWeb.Errors.View do
  use Phoenix.View, root: "lib/invoicer_web", path: "errors/templates", namespace: InvoicerWeb

  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
