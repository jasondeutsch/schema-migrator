defmodule Mix.Tasks.SchemaMigration do
  use Mix.Task

  def run(_) do
    SchemaMigrator.run()
  end
end
