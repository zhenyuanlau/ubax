defmodule UbaxWeb.Schema do
  use Absinthe.Schema

  import_types(__MODULE__.CommonTypes)
  import_types(__MODULE__.EventTypes)

  query do
    import_fields(:event_queries)
  end

  mutation do
    import_fields(:event_mutations)
  end
end
