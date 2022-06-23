defmodule Ubax.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :city, :string
    field :company, :string
    field :gender, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:gender, :company, :city])
    |> validate_required([:gender, :company, :city])
  end
end
