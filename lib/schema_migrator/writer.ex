defmodule SchemaMigrator.Writer do
  # Generate migration files
  def write_migration({schema, template}, path \\ "./migrations/") do
    File.write  path <> create_file_name(schema[:source]),template
  end

  defp create_file_name(name), do: to_string(timestamp()) <> "_add_" <> name <> ".exs"

  defp timestamp, do: System.system_time(:second)
end
