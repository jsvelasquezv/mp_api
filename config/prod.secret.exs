use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :mp_api, MpApiWeb.Endpoint,
  secret_key_base: "R0Vx+nxyNnZbEs8x4aS6EEFZbuBvWHpB3+xiBjd5gY8szXu4Dnl7ouXcRbj6AuS0"

# Configure your database
config :mp_api, MpApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "mp_api_prod",
  pool_size: 15
