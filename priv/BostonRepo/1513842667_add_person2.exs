defmodule AdvancedFind.BostonRepo.Migrations.AddTablePerson2 do
  use Ecto.Migration

  def change do
    create table("person2") do
      
        add :active, :boolean
      
        add :city, :string
      
        add :id, :id
      
        add :name, :string
      

      timestamps()
    end
  end
end
