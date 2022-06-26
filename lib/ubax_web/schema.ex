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

  def middleware(middleware, _field, %{identifier: :mutation}) do
    middleware ++ [Middleware.ChangesetErrors]
  end

  def middleware(middleware, _field, _object) do
    middleware
  end
end
