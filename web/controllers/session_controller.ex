defmodule Blog.SessionController do
  use Blog.Web, :controller

  alias Blog.Session

  def new(conn,_) do
    render conn, :new
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    {valid, user} = Blog.User.valid_authentication(email, password)
    if valid do
      conn
      # |> put_session(:user_id, user.id)
      |> Guardian.Plug.sign_in(user)
      |> redirect(to: "/")
    else
      render conn, :new
    end
  end
end
