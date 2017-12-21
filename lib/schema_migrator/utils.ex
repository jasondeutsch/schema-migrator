defmodule SchemaMigrator.Utils do

  def parse_repo(module) do
    repo = module
      |> Atom.to_string
      |> String.split(".")

    case repo do
      [_,x]  ->
        x
      [_,x,_] ->
        x
    end
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
