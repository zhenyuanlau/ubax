defmodule UbaxWeb.Schema.CommonTypes do
  use Absinthe.Schema.Notation

  enum :sort_order do
    value(:asc)
    value(:desc)
  end

  @desc "An error encountered trying to persist input"
  object :input_error do
    field :key, non_null(:string)
    field :message, non_null(:string)
  end
end
