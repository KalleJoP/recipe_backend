defmodule RecipeBackendWeb.FoodItemControllerTest do
  use RecipeBackendWeb.ConnCase

  alias RecipeBackend.Shooping
  alias RecipeBackend.Shooping.FoodItem

  @create_attrs %{
    name: "some name",
    quantity_type: "some quantity_type"
  }
  @update_attrs %{
    name: "some updated name",
    quantity_type: "some updated quantity_type"
  }
  @invalid_attrs %{name: nil, quantity_type: nil}

  def fixture(:food_item) do
    {:ok, food_item} = Shooping.create_food_item(@create_attrs)
    food_item
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all food_items", %{conn: conn} do
      conn = get(conn, Routes.food_item_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create food_item" do
    test "renders food_item when data is valid", %{conn: conn} do
      conn = post(conn, Routes.food_item_path(conn, :create), food_item: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.food_item_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "quantity_type" => "some quantity_type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.food_item_path(conn, :create), food_item: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update food_item" do
    setup [:create_food_item]

    test "renders food_item when data is valid", %{conn: conn, food_item: %FoodItem{id: id} = food_item} do
      conn = put(conn, Routes.food_item_path(conn, :update, food_item), food_item: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.food_item_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "quantity_type" => "some updated quantity_type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, food_item: food_item} do
      conn = put(conn, Routes.food_item_path(conn, :update, food_item), food_item: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete food_item" do
    setup [:create_food_item]

    test "deletes chosen food_item", %{conn: conn, food_item: food_item} do
      conn = delete(conn, Routes.food_item_path(conn, :delete, food_item))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.food_item_path(conn, :show, food_item))
      end
    end
  end

  defp create_food_item(_) do
    food_item = fixture(:food_item)
    %{food_item: food_item}
  end
end
