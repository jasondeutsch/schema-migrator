defmodule SchemMigrator.UtilsTest do
  use ExUnit.Case
  import SchemaMigrator.Utils

  describe "Utils" do
    test "parse_repo should return repo for singularly 'nested'  modules" do
      repo = :"Foo.Bar"
      assert parse_repo(repo) == "Bar"
    end

    test "parse_repo should return repo for singularly 'doubly'  modules" do
      repo = :"Foo.Bar.Baz"
      assert parse_repo(repo) == "Bar"
    end


    test "if_not_then should run function when val is nil" do
      assert if_not_then(nil, fn -> "hello world" end) == "hello world"
    end

    test "if_not_then should return val  when val is not nill" do
      assert if_not_then("literally anything but nil", fn -> "hello world" end) == "literally anything but nil"
    end
  end
end
