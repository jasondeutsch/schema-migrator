defmodule SampleModels.Company do
  use Ecto.Schema
  alias Ecto.Changeset

  schema "company" do
    field :name, :string
    field :city, :string
    field :active, :boolean
  end

  def changeset(model, params \\ %{}) do
    model
    |> Changeset.cast(params, [:name, :city,:active])
  end
end
