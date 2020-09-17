defmodule RecipeBackendWeb.RecipeItemControllerTest do
  use RecipeBackendWeb.ConnCase

  alias RecipeBackend.Shooping
  alias RecipeBackend.Shooping.RecipeItem

  @create_attrs %{
    quantity: 42
  }
  @update_attrs %{
    quantity: 43
  }
  @invalid_attrs %{quantity: nil}

  def fixture(:recipe_item) do
    {:ok, recipe_item} = Shooping.create_recipe_item(@create_attrs)
    recipe_item
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all recipe_items", %{conn: conn} do
      conn = get(conn, Routes.recipe_item_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create recipe_item" do
    test "renders recipe_item when data is valid", %{conn: conn} do
      conn = post(conn, Routes.recipe_item_path(conn, :create), recipe_item: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.recipe_item_path(conn, :show, id))

      assert %{
               "id" => id,
               "quantity" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.recipe_item_path(conn, :create), recipe_item: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update recipe_item" do
    setup [:create_recipe_item]

    test "renders recipe_item when data is valid", %{conn: conn, recipe_item: %RecipeItem{id: id} = recipe_item} do
      conn = put(conn, Routes.recipe_item_path(conn, :update, recipe_item), recipe_item: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.recipe_item_path(conn, :show, id))

      assert %{
               "id" => id,
               "quantity" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, recipe_item: recipe_item} do
      conn = put(conn, Routes.recipe_item_path(conn, :update, recipe_item), recipe_item: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete recipe_item" do
    setup [:create_recipe_item]

    test "deletes chosen recipe_item", %{conn: conn, recipe_item: recipe_item} do
      conn = delete(conn, Routes.recipe_item_path(conn, :delete, recipe_item))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.recipe_item_path(conn, :show, recipe_item))
      end
    end
  end

  defp create_recipe_item(_) do
    recipe_item = fixture(:recipe_item)
    %{recipe_item: recipe_item}
  end
end
