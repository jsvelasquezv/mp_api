# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mp_api,
  ecto_repos: [MpApi.Repo]

# Configures the endpoint
config :mp_api, MpApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RJwxtMlK+1Fp6/SqgrRs34y6mcJjeUCQqCOQCzXX1Al6SxtosEsDq6WqJzDrhhAI",
  render_errors: [view: MpApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MpApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Phauxth authentication configuration
config :phauxth,
  token_salt: "/BZBnHtI",
  endpoint: MpApiWeb.Endpoint

# Mailer configuration
config :mp_api, MpApi.Mailer,
  adapter: Bamboo.MandrillAdapter,
  api_key: System.get_env("MANDRILL_API_KEY")


# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
