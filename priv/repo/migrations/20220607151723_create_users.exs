defmodule Ubax.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :gender, :string
      add :company, :string
      add :city, :string

      timestamps()
    end
  end
end
