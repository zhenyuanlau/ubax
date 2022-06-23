defmodule UbaxWeb.Resolvers.Event do
  alias Ubax.Data.Events

  def list_events(_parent, args, _resolution) do
    {:ok, Events.list_events(args)}
  end

  def create_event(_parent, %{input: params}, _resolution) do
    case Events.create_event(params) do
      {:error, _} ->
        {:error, "Could not create event"}

      {:ok, event} ->
        event
    end
  end
end
