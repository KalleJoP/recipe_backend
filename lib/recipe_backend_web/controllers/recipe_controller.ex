defmodule RecipeBackendWeb.RecipeController do
  use RecipeBackendWeb, :controller

  alias RecipeBackend.Shooping
  alias RecipeBackend.Shooping.Recipe

  action_fallback RecipeBackendWeb.FallbackController

  def index(conn, _params) do
    recipes = Shooping.list_recipes()
    render(conn, "index.json", recipes: recipes)
  end

  def create(conn, %{"recipe" => recipe_params}) do
    with {:ok, %Recipe{} = recipe} <- Shooping.create_recipe(recipe_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.recipe_path(conn, :show, recipe))
      |> render("show.json", recipe: recipe)
    end
  end

  def show(conn, %{"id" => id}) do
    recipe = Shooping.get_recipe!(id)
    render(conn, "show.json", recipe: recipe)
  end

  def update(conn, %{"id" => id, "recipe" => recipe_params}) do
    recipe = Shooping.get_recipe!(id)

    with {:ok, %Recipe{} = recipe} <- Shooping.update_recipe(recipe, recipe_params) do
      render(conn, "show.json", recipe: recipe)
    end
  end

  def delete(conn, %{"id" => id}) do
    recipe = Shooping.get_recipe!(id)

    with {:ok, %Recipe{}} <- Shooping.delete_recipe(recipe) do
      send_resp(conn, :no_content, "")
    end
  end
end
