defmodule Mix.Tasks.SchemaMigration do
  use Mix.Task

  def run(_) do
    IO.puts "Running SchemaMigrator a.k.a. schemagator a.k.a #schema-gate"
    SchemaMigrator.run()
  end
end
