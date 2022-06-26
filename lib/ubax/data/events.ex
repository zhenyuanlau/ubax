defmodule Ubax.Data.Events do
  import Ecto.Query

  alias Ubax.{Repo, Event}

  def list_events(filters) do
    filters
    |> Enum.reduce(Event, fn
      {_, nil}, query ->
        query

      {:order, order}, query ->
        from q in query, order_by: {^order, :id}

      {:matching, matching}, query ->
        from q in query, where: ilike(q.name, ^"%#{matching}%")
    end)
    |> Repo.all()
  end

  def create_event(attrs \\ %{}) do
    %Event{}
    |> Event.changeset(attrs)
    |> Repo.insert()
  end
end
