defmodule RecipeBackend.Repo.Migrations.CreateFoodItems do
  use Ecto.Migration

  def change do
    create table(:food_items) do
      add :name, :string
      add :quantity_type, :string
      timestamps()
    end
  end
end
