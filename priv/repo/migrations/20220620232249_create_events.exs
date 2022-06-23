defmodule Ubax.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :anonymous_id, :string
      add :user_id, :integer
      add :event, :string

      timestamps()
    end
  end
end
