defmodule SchemaMigrator.Writer do
  import SchemaMigrator.Utils

  # Generate migration files
  def write_migration({schema, template}, repo,  path \\ nil) do
    path = if_not_then path, fn -> "./priv/#{parse_repo repo}/migrations/" end
    IO.puts "Wriing migration for #{schema[:source]} to #{path}..."

    mkdir_if_none path

    File.write! path <> create_file_name(schema[:source]), template
    IO.puts "Writing Successful."

    :timer.sleep(1000) # This feels shitty -- for the sake of timestamp
  end

  defp mkdir_if_none(path) do
    IO.puts "Migration directory not found. \n Creating directory #{path}..."
    File.mkdir_p! path
  end

  defp create_file_name(name), do: to_string(timestamp()) <> "_add_" <> name <> ".exs"

  defp timestamp, do: System.system_time(:second)
end
