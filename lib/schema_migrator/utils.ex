defmodule SchemaMigrator.Utils do

  def parse_repo(module) do
    [_,repo | _]=
      module
      |> Atom.to_string()
      |> String.split(".")

    repo
  end

  def if_not_then(val, func) do
    case val do
      nil ->
        func.()
      _ ->
        val
    end
  end
end
