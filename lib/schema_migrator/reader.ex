defmodule SchemaMigrator.Reader do

  # Read model files
  def load_models(path) do
    path = Path.wildcard path <> "/*.ex"
    models = Enum.map path, fn files -> Code.load_file(files) end
    models
      |> List.flatten
      |> Enum.map(fn {k, _} -> k end)
  end

  def get_struct(module) do
    {s, _} = Code.eval_string("%#{module}{}.__struct__")
    s
  end

  # TODO: what if there is no schema?
  def get_schema(struct) do
    %{
       source: struct.__schema__(:source),
       primary_key: struct.__schema__(:primary_key),
       types: struct.__schema__(:types),
       associations: struct.__schema__(:associations)
     }
  end
end
