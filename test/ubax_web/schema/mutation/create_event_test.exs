defmodule UbaxWeb.Schema.Mutation.CreateEventTest do
  use UbaxWeb.ConnCase, async: true

  setup do
    Ubax.Cube.Seeds.run()
  end

  @query """
  mutation ($input: EventInput!) {
    createEvent(input: $input) {
      event {
        name
      }
    }
  }
  """
  test "createEvent field creates an event" do
    input = %{
      "name" => "talking"
    }

    response = post(build_conn(), "/api", query: @query, variables: %{"input" => input})

    assert %{
             "data" => %{
               "createEvent" => %{
                 "event" => %{
                   "name" => "talking"
                 }
               }
             }
           } = json_response(response, 200)
  end

  @query """
  mutation createEvent($input: EventInput!){

    createEvent(input: $input) {

      errors {
        key
        message
      }
      event {
        name
      }
    }
  }
  """
  test "createEvent field creates an event when event less then 3 chars" do
    input = %{
      "name" => "t"
    }

    response = post(build_conn(), "/api", query: @query, variables: %{"input" => input})

    assert %{
             "data" => %{
               "createEvent" => %{
                 "errors" => [
                   %{
                     "key" => "name",
                     "message" => "should be at least 3 character(s)"
                   }
                 ],
                 "event" => nil
               }
             }
           } = json_response(response, 200)
  end
end
