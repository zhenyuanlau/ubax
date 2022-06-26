defmodule UbaxWeb.Resolvers.Event do
  alias Ubax.Data.Events

  def list_events(_parent, args, _resolution) do
    {:ok, Events.list_events(args)}
  end

  def create_event(_parent, %{input: params}, _resolution) do
    case Events.create_event(params) do
      {:error, changeset} ->
        {:ok, %{errors: error_details(changeset)}}

      {:ok, event} ->
        {:ok, %{event: event}}
    end
  end

  defp error_details(changeset) do
    changeset
    |> Ecto.Changeset.traverse_errors(&format_error/1)
    |> Enum.map(fn
      {key, value} ->
        %{key: key, message: value}
    end)
  end

  @spec format_error(Ecto.Changeset.error()) :: String.t()
  defp format_error({msg, opts}) do
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", to_string(value))
    end)
  end
end
