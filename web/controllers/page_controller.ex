defmodule IntoSql.PageController do
  use IntoSql.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
