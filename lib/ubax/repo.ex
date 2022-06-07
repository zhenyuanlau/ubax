defmodule Ubax.Repo do
  use Ecto.Repo,
    otp_app: :ubax,
    adapter: Ecto.Adapters.Postgres
end
