defmodule SchemaMigrator.Writer do

  # create directories if none exist
  def create_dirs do
    Mix.Generator.create_directory "./schema_migrator"
  end


  # generate migration files
  def gen_file(path, filename, content) do
    Mix.Generator.create_file  path <> create_file_name(filename), content
  end

  defp create_file_name(name), do: to_string(timestamp()) <> "_add_" <> name <> ".exs"

  defp timestamp, do: System.system_time(:second)
end
