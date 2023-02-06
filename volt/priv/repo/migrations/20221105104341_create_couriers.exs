defmodule Volt.Repo.Migrations.CreateCouriers do
  use Ecto.Migration

 def change do
    create table(:couriers) do
      add :name, :string, null: false
      add :surname, :string
      add :username, :string, null: false
      add :date_of_birth, :date
      add :email, :string, null: false
      add :password, :string, null: false

      timestamps()
    end
    create unique_index(:couriers, [:username])
  end
end
