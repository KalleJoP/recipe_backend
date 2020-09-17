defmodule RecipeBackendWeb.RecipeView do
  use RecipeBackendWeb, :view
  alias RecipeBackendWeb.RecipeView
  alias RecipeBackendWeb.RecipeItemView

  def render("index.json", %{recipes: recipes}) do
    IO.inspect(recipes)
    # %{data: render_many(recipes, RecipeView, "recipe.json")}
    render_many(recipes, RecipeView, "recipe.json")
  end

  def render("show.json", %{recipe: recipe}) do
    %{data: render_one(recipe, RecipeView, "recipe.json")}
  end

  def render("recipe.json", %{recipe: recipe}) do
    %{
      id: recipe.id,
      name: recipe.name,
      description: recipe.description,
      picture: recipe.picture,
      recipe_items: render_many(recipe.recipe_item, RecipeItemView, "recipe_item.json")
    }
  end
end
