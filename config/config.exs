# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :recipe_backend,
  ecto_repos: [RecipeBackend.Repo]

# Configures the endpoint
config :recipe_backend, RecipeBackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QvAOX8bA9fqiTOXO59MqFlMX2i5+Jtp0p7y7MWvbZI8LVF4V4o7iVk2XLtoxK8Hp",
  render_errors: [view: RecipeBackendWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RecipeBackend.PubSub,
  live_view: [signing_salt: "f6DnUNqhHmzrvU4tKqVRXMPv5r42Wz8Z"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
