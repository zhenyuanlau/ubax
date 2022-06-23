defmodule Ubax.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :anonymous_id, :string
    field :event, :string
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:anonymous_id, :user_id, :event])
    |> validate_required([:user_id, :event])
  end
end
