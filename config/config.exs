# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :blog, Blog.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "q8ofO3LQmCqjOrj0u3lwr6JmUrBKYk+o+rl2lbvqka/mq14OK+amM/Hnxq1G53QD",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Blog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Blog",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "n+RuxnybSggdkJVDTt9Bk3oy6fsjDNK6aDiW0A/sY4vyOBXiPDm5SeTKd+/NXhgn", #System.get_env("BLOG_JWT_TOKEN"),
  serializer: Blog.GuardianSerializer
