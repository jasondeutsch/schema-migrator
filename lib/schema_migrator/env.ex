defmodule SchemaMigrator.Env do

  @repos hd Application.get_env(:schema_migrator, :repos)

  def repos, do: @repos
end
