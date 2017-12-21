defmodule SchemaMigrator do
  @moduledoc """
  Documentation for SchemaMigrator.
  """
  alias SchemaMigrator.Env
  alias SchemaMigrator.Writer
  alias SchemaMigrator.Template
  alias SchemaMigrator.Reader

  require Logger

  @doc """
  """
  def run do
    repos = Env.repos
    run_migrator repos, "./lib/sample_models/"
  end

  defp run_migrator(repo, path) do
    path
    |> Reader.process
    |> IO.inspect
    |> Enum.map(fn x -> Template.gen_template(x, repo) end)
    |> Enum.map(fn x-> Writer.write_migration(x) end)
  end
end
