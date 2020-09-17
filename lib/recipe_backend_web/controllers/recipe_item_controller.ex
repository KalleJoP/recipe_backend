defmodule RecipeBackendWeb.RecipeItemController do
  use RecipeBackendWeb, :controller

  alias RecipeBackend.Shooping
  alias RecipeBackend.Shooping.RecipeItem

  action_fallback RecipeBackendWeb.FallbackController

  def index(conn, _params) do
    recipe_items = Shooping.list_recipe_items()
    render(conn, "index.json", recipe_items: recipe_items)
  end

  def create(conn, %{"recipe_item" => recipe_item_params}) do
    with {:ok, %RecipeItem{} = recipe_item} <- Shooping.create_recipe_item(recipe_item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.recipe_item_path(conn, :show, recipe_item))
      |> render("show.json", recipe_item: recipe_item)
    end
  end

  def show(conn, %{"id" => id}) do
    recipe_item = Shooping.get_recipe_item!(id)
    render(conn, "show.json", recipe_item: recipe_item)
  end

  def update(conn, %{"id" => id, "recipe_item" => recipe_item_params}) do
    recipe_item = Shooping.get_recipe_item!(id)

    with {:ok, %RecipeItem{} = recipe_item} <- Shooping.update_recipe_item(recipe_item, recipe_item_params) do
      render(conn, "show.json", recipe_item: recipe_item)
    end
  end

  def delete(conn, %{"id" => id}) do
    recipe_item = Shooping.get_recipe_item!(id)

    with {:ok, %RecipeItem{}} <- Shooping.delete_recipe_item(recipe_item) do
      send_resp(conn, :no_content, "")
    end
  end
end
