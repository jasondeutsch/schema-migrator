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
  Run from inside an iex session for your application.
  """
  def run do
    repos = Env.config
    Enum.each repos, fn {k, v} -> run_migrator k, v end
  end

  defp run_migrator(repo, modules) do
    modules
    |> Reader.process
    |> IO.inspect
    |> Enum.map(fn x -> Template.gen_template(x, repo) end)
    |> Enum.map(fn x-> Writer.write_migration(x, repo) end)
  end
end
