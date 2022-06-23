defmodule Ubax.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:user_id])
    |> validate_required([:user_id])
  end
end
