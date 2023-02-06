defmodule Volt.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :description, :string
      add :price, :string
      add :status, :string

      timestamps()
    end
  end
end
