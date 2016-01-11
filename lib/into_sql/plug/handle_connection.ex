defmodule IntoSql.Plug.HandleConnection do
  @moduledoc """
  IntoSql database interaction is a little different from traditional web apps.
  We don't have a connection pool to an specific database because we just
  don't know which database to connect to. The user is able to specify a custom
  host, port, database, username and password. Anything can change from one
  user session to the other.

  To solve this issue, IntoSql manages connections per request. It opens a new
  connection when the request arrives and closes it when the processing is
  done. This is not an efficient solution, but it get things done for now.
  
  The credentials specified by the user are stored in the session
  """

  alias Plug.Conn
  @behaviour Plug

  def init(opts), do: opts

  def call(conn, _opts) do
    Conn.register_before_send(conn, &cleanup_connection(&1))
    ensure_connection(conn)
  end

  defp ensure_connection(conn) do
    # TODO: Open connection
    conn
  end

  defp cleanup_connection(conn) do
    # TODO: Close connection
    conn
  end
end
