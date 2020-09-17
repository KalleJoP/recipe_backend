defmodule RecipeBackend.Repo do
  use Ecto.Repo,
    otp_app: :recipe_backend,
    adapter: Ecto.Adapters.Postgres
end
