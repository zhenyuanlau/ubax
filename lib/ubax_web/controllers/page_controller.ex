defmodule UbaxWeb.PageController do
  use UbaxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
