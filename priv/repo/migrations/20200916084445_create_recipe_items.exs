defmodule RecipeBackend.Repo.Migrations.CreateRecipeItems do
  use Ecto.Migration

  def change do
    create table(:recipe_items) do
      add :quantity, :integer
      add :food_item_id, references(:food_items, on_delete: :nothing)
      add :recipe, references(:recipes, on_delete: :nothing)

      timestamps()
    end

    create index(:recipe_items, [:food_item_id])
    create index(:recipe_items, [:recipe])
  end
end
