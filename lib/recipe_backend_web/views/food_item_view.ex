defmodule RecipeBackendWeb.FoodItemView do
  use RecipeBackendWeb, :view
  alias RecipeBackendWeb.FoodItemView

  def render("index.json", %{food_items: food_items}) do
    # %{data: render_many(food_items, FoodItemView, "food_item.json")}
    render_many(food_items, FoodItemView, "food_item.json")
  end

  def render("show.json", %{food_item: food_item}) do
    %{data: render_one(food_item, FoodItemView, "food_item.json")}
  end

  def render("food_item.json", %{food_item: food_item}) do
    %{
      id: food_item.id,
      name: food_item.name,
      quantity_type: food_item.quantity_type
    }
  end
end
