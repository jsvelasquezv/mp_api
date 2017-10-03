use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mp_api, MpApiWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :mp_api, MpApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "mp_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Mailer test configuration
config :mp_api, MpApi.Mailer,
  adapter: Bamboo.TestAdapter
