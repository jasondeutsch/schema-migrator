defmodule SchemaMigrator.Writer do
  import SchemaMigrator.Utils, only: [parse_repo: 1, parse_module: 1, if_not_then: 2]

  # Generate migration files
  def write_migration({module, template}, repo, path \\ nil) do
    path = if_not_then path, fn -> "./priv/#{parse_repo repo}/migrations/" end
    IO.puts "Wriing migration for #{parse_module module} to #{path}..."

    mkdir_if_none path

    File.write! path <> create_file_name(parse_module module), template
    IO.puts "Writing Successful."

    :timer.sleep(1000) # This is shitty -- for the sake of timestamp
  end

  defp mkdir_if_none(path) do
    IO.puts "Migration directory not found. \n Creating directory #{path}..."
    File.mkdir_p! path
  end

  defp create_file_name(name) do
    to_string(timestamp()) <> "_add_" <> name <> ".exs"
  end

  defp timestamp, do: System.system_time(:second)
end
