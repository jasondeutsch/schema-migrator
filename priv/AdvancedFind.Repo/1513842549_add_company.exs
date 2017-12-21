defmodule AdvancedFind.Repo.Migrations.AddTableCompany do
  use Ecto.Migration

  def change do
    create table("company") do
      
        add :active, :boolean
      
        add :city, :string
      
        add :id, :id
      
        add :name, :string
      

      timestamps()
    end
  end
end
