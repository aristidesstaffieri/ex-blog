defmodule Blog.LoadCurrentUser do
  def init(opts) do
    opts
  end

  def call(conn, opts) do
    user_id = Plug.Conn.get_session(conn, :user_id)
    if !user_id do
      conn
    else
      user = Blog.Repo.get(Blog.User, user_id)
      Plug.Conn.assign(conn, :current_user, user)
    end
  end
end
