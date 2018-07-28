# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :backerbackend,
  ecto_repos: [Backerbackend.Repo]

# Configures the endpoint
config :backerbackend, BackerbackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "U6rb9AJCDoSe1LtiNJOsLGzUW8+S60TApNALK1lnjems+w+yx3pcMD2d4dskTxax",
  render_errors: [view: BackerbackendWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Backerbackend.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Configures Guardian
config :backerbackend, Backerbackend.Auth.Guardian,
  issuer: "backerbackend",
  secret_key: "HNinpKh9Ne3tr8BpjCpAEh0xzCqTIG3PWsfkR2AtzvUaRIpbs6oIQ9RcmjmGPekJ"

config :backerbackend, Backerbackend.Auth.AuthAccessPipeline,
  module: Backerbackend.Auth.Guardian,
  error_handler: Backerbackend.Auth.AuthErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
