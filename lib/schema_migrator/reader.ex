defmodule SchemaMigrator.Reader do
  @moduledoc """
  Map over files in directory to extra schema data.

  returns {Module, Schema}
  """

  def process(modules) do
    modules
    |> IO.inspect
    |> Enum.map(&get_struct/1)
    |> IO.inspect
    |> Enum.map(&get_schema/1)
  end

  #  for loading modules dynamicall
  #  its better to set in config
  #
  # def process(path) do
  #   path
  #   |> IO.inspect
  #   |> load_models
  #   |> IO.inspect
  #   |> Enum.map(&get_struct/1)
  #   |> IO.inspect
  #   |> Enum.map(&get_schema/1)
  # end

 #  for loading modules dynamicall
 #  its better to set in config
 #
 #  def load_models(path) do
 #    path = Path.wildcard path <> "/*.ex"
 #    models = Enum.map path, fn files -> Code.load_file(files) end
 #    models
 #      |> List.flatten
 #      |> Enum.map(fn {k, _} -> k end)
 #  end

  def get_struct(module) do
    {s, _} = Code.eval_string("%#{module}{}.__struct__")
    {module, s}
  end

  # TODO: what if there is no schema?
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
