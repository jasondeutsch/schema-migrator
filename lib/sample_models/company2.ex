defmodule SampleModels.Company2 do
  use Ecto.Schema
  alias Ecto.Changeset

  schema "company2" do
    field :name, :string
    field :city, :string
    field :active, :boolean
  end

  def changeset(model, params \\ %{}) do
    model
    |> Changeset.cast(params, [:name, :city,:active])
  end
end
