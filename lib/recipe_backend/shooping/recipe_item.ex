defmodule RecipeBackend.Shooping.RecipeItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias RecipeBackend.Shooping.FoodItem

  schema "recipe_items" do
    field :quantity, :integer
    # field :food_item_id, :id
    field :recipe, :id
    belongs_to(:food_item, FoodItem, foreign_key: :food_item_id)
    timestamps()
  end

  @doc false
  def changeset(recipe_item, attrs) do
    recipe_item
    |> cast(attrs, [:quantity])
    |> validate_required([:quantity])
  end
end
