defmodule Volt.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :name, :string, null: false
      add :surname, :string
      add :date_of_birth, :date
      add :email, :string, null: false
      add :password, :string, null: false
      add :address, :string, null: false
      add :card_number, :string, null: false

      timestamps()
    end
  end
end
