defmodule RecipeBackendWeb.RecipeItemView do
  use RecipeBackendWeb, :view
  alias RecipeBackendWeb.RecipeItemView
  alias RecipeBackendWeb.FoodItemView

  def render("index.json", %{recipe_items: recipe_items}) do
    %{data: render_many(recipe_items, RecipeItemView, "recipe_item.json")}
  end

  def render("show.json", %{recipe_item: recipe_item}) do
    %{data: render_one(recipe_item, RecipeItemView, "recipe_item.json")}
  end

  def render("recipe_item.json", %{recipe_item: recipe_item}) do
    %{
      id: recipe_item.id,
      quantity: recipe_item.quantity,
      food_item: render_one(recipe_item.food_item, FoodItemView, "food_item.json")
    }
  end
end
