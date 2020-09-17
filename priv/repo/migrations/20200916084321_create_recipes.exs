defmodule RecipeBackend.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :name, :string
      add :description, :string
      add :picture, :string
      timestamps()
    end
  end
end
