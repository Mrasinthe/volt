defmodule Volt.Repo.Migrations.AddItemsAndRestaurants do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :itemStatus, :string, default: "active"
      add :restaurant_id, references(:restaurants)
    end
  end
end
