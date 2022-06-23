defmodule UbaxWeb.Schema.Mutation.CreateEventTest do
  use UbaxWeb.ConnCase, async: true

  setup do
    Ubax.Cube.Seeds.run()
  end

  @query """
  mutation ($input: EventInput!) {
    createEvent(input: $input) {
      event
    }
  }
  """
  test "createEvent field creates an event" do
    input = %{
      "event" => "talking",
      "userId" => 5
    }

    response = post(build_conn(), "/api", query: @query, variables: %{"input" => input})

    assert %{
             "data" => %{
               "createEvent" => %{
                 "event" => "talking"
               }
             }
           } = json_response(response, 200)
  end
end
