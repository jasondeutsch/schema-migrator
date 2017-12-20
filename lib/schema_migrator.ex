defmodule SchemaMigrator do
  @moduledoc """
  Documentation for SchemaMigrator.
  """
  import SchemaMigrator.Env
  import SchemaMigrator.Writer
  import SchemaMigrator.Template
  import SchemaMigrator.Reader

  @doc """
  Hello world.

  ## Examples

      iex> SchemaMigrator.hello
      :world

  """
  def run do
    load_models
    |> Enum.map(&get_struct/1)
    |> IO.inspect
    |> Enum.map(&get_schema/1)
    |> IO.inspect
    |> Enum.map(&gen_template/1)
    |> Enum.map(&gen_file/1)
  end
end
