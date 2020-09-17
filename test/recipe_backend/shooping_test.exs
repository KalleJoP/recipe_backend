defmodule RecipeBackend.ShoopingTest do
  use RecipeBackend.DataCase

  alias RecipeBackend.Shooping

  describe "recipes" do
    alias RecipeBackend.Shooping.Recipe

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def recipe_fixture(attrs \\ %{}) do
      {:ok, recipe} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shooping.create_recipe()

      recipe
    end

    test "list_recipes/0 returns all recipes" do
      recipe = recipe_fixture()
      assert Shooping.list_recipes() == [recipe]
    end

    test "get_recipe!/1 returns the recipe with given id" do
      recipe = recipe_fixture()
      assert Shooping.get_recipe!(recipe.id) == recipe
    end

    test "create_recipe/1 with valid data creates a recipe" do
      assert {:ok, %Recipe{} = recipe} = Shooping.create_recipe(@valid_attrs)
      assert recipe.description == "some description"
      assert recipe.name == "some name"
    end

    test "create_recipe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shooping.create_recipe(@invalid_attrs)
    end

    test "update_recipe/2 with valid data updates the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{} = recipe} = Shooping.update_recipe(recipe, @update_attrs)
      assert recipe.description == "some updated description"
      assert recipe.name == "some updated name"
    end

    test "update_recipe/2 with invalid data returns error changeset" do
      recipe = recipe_fixture()
      assert {:error, %Ecto.Changeset{}} = Shooping.update_recipe(recipe, @invalid_attrs)
      assert recipe == Shooping.get_recipe!(recipe.id)
    end

    test "delete_recipe/1 deletes the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{}} = Shooping.delete_recipe(recipe)
      assert_raise Ecto.NoResultsError, fn -> Shooping.get_recipe!(recipe.id) end
    end

    test "change_recipe/1 returns a recipe changeset" do
      recipe = recipe_fixture()
      assert %Ecto.Changeset{} = Shooping.change_recipe(recipe)
    end
  end

  describe "food_items" do
    alias RecipeBackend.Shooping.FoodItem

    @valid_attrs %{name: "some name", quantity_type: "some quantity_type"}
    @update_attrs %{name: "some updated name", quantity_type: "some updated quantity_type"}
    @invalid_attrs %{name: nil, quantity_type: nil}

    def food_item_fixture(attrs \\ %{}) do
      {:ok, food_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shooping.create_food_item()

      food_item
    end

    test "list_food_items/0 returns all food_items" do
      food_item = food_item_fixture()
      assert Shooping.list_food_items() == [food_item]
    end

    test "get_food_item!/1 returns the food_item with given id" do
      food_item = food_item_fixture()
      assert Shooping.get_food_item!(food_item.id) == food_item
    end

    test "create_food_item/1 with valid data creates a food_item" do
      assert {:ok, %FoodItem{} = food_item} = Shooping.create_food_item(@valid_attrs)
      assert food_item.name == "some name"
      assert food_item.quantity_type == "some quantity_type"
    end

    test "create_food_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shooping.create_food_item(@invalid_attrs)
    end

    test "update_food_item/2 with valid data updates the food_item" do
      food_item = food_item_fixture()
      assert {:ok, %FoodItem{} = food_item} = Shooping.update_food_item(food_item, @update_attrs)
      assert food_item.name == "some updated name"
      assert food_item.quantity_type == "some updated quantity_type"
    end

    test "update_food_item/2 with invalid data returns error changeset" do
      food_item = food_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Shooping.update_food_item(food_item, @invalid_attrs)
      assert food_item == Shooping.get_food_item!(food_item.id)
    end

    test "delete_food_item/1 deletes the food_item" do
      food_item = food_item_fixture()
      assert {:ok, %FoodItem{}} = Shooping.delete_food_item(food_item)
      assert_raise Ecto.NoResultsError, fn -> Shooping.get_food_item!(food_item.id) end
    end

    test "change_food_item/1 returns a food_item changeset" do
      food_item = food_item_fixture()
      assert %Ecto.Changeset{} = Shooping.change_food_item(food_item)
    end
  end

  describe "recipe_items" do
    alias RecipeBackend.Shooping.RecipeItem

    @valid_attrs %{quantity: 42}
    @update_attrs %{quantity: 43}
    @invalid_attrs %{quantity: nil}

    def recipe_item_fixture(attrs \\ %{}) do
      {:ok, recipe_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shooping.create_recipe_item()

      recipe_item
    end

    test "list_recipe_items/0 returns all recipe_items" do
      recipe_item = recipe_item_fixture()
      assert Shooping.list_recipe_items() == [recipe_item]
    end

    test "get_recipe_item!/1 returns the recipe_item with given id" do
      recipe_item = recipe_item_fixture()
      assert Shooping.get_recipe_item!(recipe_item.id) == recipe_item
    end

    test "create_recipe_item/1 with valid data creates a recipe_item" do
      assert {:ok, %RecipeItem{} = recipe_item} = Shooping.create_recipe_item(@valid_attrs)
      assert recipe_item.quantity == 42
    end

    test "create_recipe_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shooping.create_recipe_item(@invalid_attrs)
    end

    test "update_recipe_item/2 with valid data updates the recipe_item" do
      recipe_item = recipe_item_fixture()
      assert {:ok, %RecipeItem{} = recipe_item} = Shooping.update_recipe_item(recipe_item, @update_attrs)
      assert recipe_item.quantity == 43
    end

    test "update_recipe_item/2 with invalid data returns error changeset" do
      recipe_item = recipe_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Shooping.update_recipe_item(recipe_item, @invalid_attrs)
      assert recipe_item == Shooping.get_recipe_item!(recipe_item.id)
    end

    test "delete_recipe_item/1 deletes the recipe_item" do
      recipe_item = recipe_item_fixture()
      assert {:ok, %RecipeItem{}} = Shooping.delete_recipe_item(recipe_item)
      assert_raise Ecto.NoResultsError, fn -> Shooping.get_recipe_item!(recipe_item.id) end
    end

    test "change_recipe_item/1 returns a recipe_item changeset" do
      recipe_item = recipe_item_fixture()
      assert %Ecto.Changeset{} = Shooping.change_recipe_item(recipe_item)
    end
  end
end
