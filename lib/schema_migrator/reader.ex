defmodule SchemaMigrator.Reader do
  @moduledoc """
  """

  def process(modules) do
    modules
    |> IO.inspect
    |> Enum.map(&get_struct/1)
    |> IO.inspect
    |> Enum.map(&get_schema/1)
  end

  def get_struct(module) do
    {s, _} = Code.eval_string("%#{module}{}.__struct__")
    {module, s}
  end

  def get_schema({module, struct}) do
    {
      module,
      %{
         source: struct.__schema__(:source),
         primary_key: struct.__schema__(:primary_key),
         types: struct.__schema__(:types),
         associations: struct.__schema__(:associations)
       }
    }
  end
end
