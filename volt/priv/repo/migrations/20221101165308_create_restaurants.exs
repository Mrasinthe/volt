defmodule Volt.Repo.Migrations.CreateRestaurants do
  use Ecto.Migration

  def change do
    create table(:restaurants) do
      add :username, :string
      add :rname, :string
      add :email, :string
      add :address, :string
      add :password, :string
      add :tag, :string

      timestamps()
    end
  end
end
