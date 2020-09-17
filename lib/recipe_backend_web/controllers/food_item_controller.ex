defmodule RecipeBackendWeb.FoodItemController do
  use RecipeBackendWeb, :controller

  alias RecipeBackend.Shooping
  alias RecipeBackend.Shooping.FoodItem

  action_fallback RecipeBackendWeb.FallbackController

  def index(conn, _params) do
    food_items = Shooping.list_food_items()
    render(conn, "index.json", food_items: food_items)
  end

  def create(conn, %{"food_item" => food_item_params}) do
    with {:ok, %FoodItem{} = food_item} <- Shooping.create_food_item(food_item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.food_item_path(conn, :show, food_item))
      |> render("show.json", food_item: food_item)
    end
  end

  def show(conn, %{"id" => id}) do
    food_item = Shooping.get_food_item!(id)
    render(conn, "show.json", food_item: food_item)
  end

  def update(conn, %{"id" => id, "food_item" => food_item_params}) do
    food_item = Shooping.get_food_item!(id)

    with {:ok, %FoodItem{} = food_item} <- Shooping.update_food_item(food_item, food_item_params) do
      render(conn, "show.json", food_item: food_item)
    end
  end

  def delete(conn, %{"id" => id}) do
    food_item = Shooping.get_food_item!(id)

    with {:ok, %FoodItem{}} <- Shooping.delete_food_item(food_item) do
      send_resp(conn, :no_content, "")
    end
  end
end
