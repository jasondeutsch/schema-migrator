defmodule AdvancedFind.BostonRepo.Migrations.AddTableCompany2 do
  use Ecto.Migration

  def change do
    create table("company2") do
      
        add :active, :boolean
      
        add :city, :string
      
        add :id, :id
      
        add :name, :string
      

      timestamps()
    end
  end
end
