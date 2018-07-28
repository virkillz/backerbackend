defmodule BackerbackendWeb.PageController do
  use BackerbackendWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
