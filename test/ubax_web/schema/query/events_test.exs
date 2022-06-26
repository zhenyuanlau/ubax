defmodule UbaxWeb.Schema.Query.EventsTest do
  use UbaxWeb.ConnCase, async: true

  setup do
    Ubax.Cube.Seeds.run()
    on_exit(fn -> Ubax.Cube.Seeds.clear() end)
  end

  @query """
  {
    events {
      user_id
    }
  }
  """
  test "events field returns list of event" do
    conn = build_conn()
    conn = get conn, "/api", query: @query

    assert json_response(conn, 200) == %{
             "data" => %{
               "events" => [
                 %{
                   "user_id" => 1
                 },
                 %{
                   "user_id" => 2
                 }
               ]
             }
           }
  end

  @query """
  {
    events(matching: "working") {
      user_id
    }
  }
  """
  test "events field returns list of event by event name" do
    conn = build_conn()
    conn = get conn, "/api", query: @query

    assert json_response(conn, 200) == %{
             "data" => %{
               "events" => [
                 %{
                   "user_id" => 1
                 }
               ]
             }
           }
  end

  @query """
  query ($matching: String) {
    events(matching: $matching) {
      user_id
    }
  }
  """
  @variables %{"matching" => "working"}
  test "events field filters by event name when using a variable" do
    response = get(build_conn(), "/api", query: @query, variables: @variables)

    assert json_response(response, 200) == %{
             "data" => %{
               "events" => [
                 %{"user_id" => 1}
               ]
             }
           }
  end

  @query """
  query ($order: SortOrder!) {
    events(order: $order) {
      user_id
    }
  }
  """
  @variables %{"order" => "DESC"}
  test "events field returns events descending using variable" do
    response = get(build_conn(), "/api", query: @query, variables: @variables)

    assert %{
             "data" => %{"events" => [%{"user_id" => 2} | _]}
           } = json_response(response, 200)
  end
end
