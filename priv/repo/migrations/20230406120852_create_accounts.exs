defmodule Fresco.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :name, :string
      add :brand_color, :string

      timestamps()
    end

    create unique_index(:accounts, [:name])
  end
end
