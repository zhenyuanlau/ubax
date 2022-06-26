defmodule Ubax.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :anonymous_id, :string
    field :name, :string
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:anonymous_id, :user_id, :name], empty_values: ["", "NULL"])
    |> validate_required([:name])
    |> validate_length(:name, min: 3)
  end
end
