import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :volt, Volt.Repo,
  username: "postgres",
  password: "postgres",
  database: "volt_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "postgres",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 15

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :volt, VoltWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "SikZKVryGk2umgbFWDPOsRxCKUyEyal4Armh45ds8rv/TQAydTqBONkJfwwkiUDS",
  server: true

# In test we don't send emails.
config :volt, Volt.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
config :volt, sql_sandbox: true
config :hound, driver: "chrome_driver"

# Initialize plugs at runtime for faster test compilation
#config :phoenix, :plug_init_mode, :runtime
