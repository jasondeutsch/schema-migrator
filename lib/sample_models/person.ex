defmodule SampleModels.Person do
  use Ecto.Schema
  alias Ecto.Changeset

  schema "person" do
    field :name, :string
    field :city, :string, default: "Austin"
    field :active, :boolean
  end

  def changeset(model, params \\ %{}) do
    model
    |> Changeset.cast(params, [:name, :city,:active])
  end
end
