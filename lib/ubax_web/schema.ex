defmodule UbaxWeb.Schema do
  use Absinthe.Schema

  alias UbaxWeb.Schema.Middleware

  import_types(__MODULE__.CommonTypes)
  import_types(__MODULE__.EventTypes)

  query do
    import_fields(:event_queries)
  end

  mutation do
    import_fields(:event_mutations)
  end

  def middleware(middleware, field, object) do
    middleware
    |> apply(:errors, field, object)
    |> apply(:debug, field, object)
  end

  defp apply(middleware, :errors, _field, %{identifier: :mutation}) do
    middleware ++ [Middleware.ChangesetErrors]
  end

  defp apply(middleware, :debug, _field, _object) do
    if System.get_env("DEBUG") do
      [{Middleware.Debug, :start}] ++ middleware
    else
      middleware
    end
  end

  defp apply(middleware, _, _, _) do
    middleware
  end
end
