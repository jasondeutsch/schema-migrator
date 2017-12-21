defmodule SchemaMigrator.Env do

  @config Application.get_env(:schema_migrator, :repos)

  def config, do: @config
end
