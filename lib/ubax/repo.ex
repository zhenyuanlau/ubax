defmodule Ubax.Repo do
  use Ecto.Repo,
    otp_app: :ubax,
    adapter: Ecto.Adapters.Postgres

  def count(table) do
    aggregate(table, :count, :id)
  end
end
