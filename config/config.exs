import Config

version = Mix.Project.config()[:version]

config :invoicer,
  ecto_repos: [Invoicer.Repo],
  version: version

config :phoenix, :json_library, Jason

config :invoicer, InvoicerWeb.Endpoint,
  pubsub_server: Invoicer.PubSub,
  render_errors: [view: InvoicerWeb.Errors.View, accepts: ~w(html json)]

config :invoicer, Invoicer.Repo, start_apps_before_migration: [:ssl]

config :invoicer, Corsica, allow_headers: :all

config :invoicer, Invoicer.Gettext, default_locale: "en"

config :invoicer, InvoicerWeb.ContentSecurityPolicy, allow_unsafe_scripts: false

config :sentry,
  root_source_code_path: File.cwd!(),
  release: version

config :logger, backends: [:console, Sentry.LoggerBackend]

# Import environment configuration
import_config "#{Mix.env()}.exs"
