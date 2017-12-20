defmodule person.addTablePerson do
  use Ecto.Migration

  def change do
    create table(person) do
      
        add active, boolean
      
        add city, string
      
        add id, id
      
        add name, string
      

      timestamps()
    end
  end
end

