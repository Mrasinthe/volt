defmodule Volt.Repo.Migrations.CreateOrderitem do
  use Ecto.Migration

  def change do
    create table(:orderitem) do
      add :quantity, :string

      timestamps()
    end
  end
end
