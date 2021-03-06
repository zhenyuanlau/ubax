defmodule UbaxWeb.Schema.EventTypes do
  use Absinthe.Schema.Notation

  alias UbaxWeb.Resolvers

  object :event_queries do
    @desc "List all events"
    field :events, list_of(:event) do
      arg(:matching, :string)
      arg(:order, :sort_order, default_value: :asc)
      resolve(&Resolvers.Event.list_events/3)
    end
  end

  object :event_mutations do
    field :create_event, :event_result do
      arg(:input, non_null(:event_input))
      resolve(&Resolvers.Event.create_event/3)
    end
  end

  object :event do
    field :id, :id
    field :name, :string
    field :user_id, :integer
    field :anonymous_id, :string
  end

  @desc "Filtering options for the event list"
  input_object :event_filter do
    field :name, :string
  end

  @desc "Event Input Object"
  input_object :event_input do
    field :name, non_null(:string)
    field :user_id, :integer
    field :anonymous_id, :string
  end

  object :event_result do
    field :event, :event
    field :errors, list_of(:input_error)
  end
end
