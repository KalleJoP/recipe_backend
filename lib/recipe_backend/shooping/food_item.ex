defmodule RecipeBackend.Shooping.FoodItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_items" do
    field :name, :string
    field :quantity_type, :string
    timestamps()
  end

  @doc false
  def changeset(food_item, attrs) do
    food_item
    |> cast(attrs, [:name, :quantity_type])
    |> validate_required([:name, :quantity_type])
  end
end
