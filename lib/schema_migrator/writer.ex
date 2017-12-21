defmodule SchemaMigrator.Writer do
  import SchemaMigrator.Utils

  # Generate migration files
  def write_migration({schema, template}, repo,  path \\ nil) do
    path = if_not_then path, fn -> "./priv/#{parse_repo repo}/" end

    mkdir_if_none path
    File.write! path <> create_file_name(schema[:source]),template
  end
  
  defp mkdir_if_none(path), do: File.mkdir_p! path

  defp create_file_name(name), do: to_string(timestamp()) <> "_add_" <> name <> ".exs"

  defp timestamp, do: System.system_time(:second)
end
