defmodule SchemaMigratorTest do
  use ExUnit.Case
  doctest SchemaMigrator

  test "greets the world" do
    assert SchemaMigrator.hello() == :world
  end
end
