defmodule RecipeBackend.Shooping.Recipe do
  use Ecto.Schema
  import Ecto.Changeset
  alias RecipeBackend.Shooping.RecipeItem

  schema "recipes" do
    field :description, :string
    field :name, :string
    field :picture, :string
    has_many(:recipe_item, RecipeItem, foreign_key: :recipe)

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:name, :description, :picture])
    |> validate_required([:name, :description])
  end
end
