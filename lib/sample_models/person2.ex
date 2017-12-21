defmodule SampleModels.Person2 do
  use Ecto.Schema
  alias Ecto.Changeset

  schema "person2" do
    field :name, :string
    field :city, :string, default: "Austin"
    field :active, :boolean
  end

  def changeset(model, params \\ %{}) do
    model
    |> Changeset.cast(params, [:name, :city,:active])
  end
end
