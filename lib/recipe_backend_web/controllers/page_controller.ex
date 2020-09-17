defmodule RecipeBackendWeb.PageController do
  use RecipeBackendWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
