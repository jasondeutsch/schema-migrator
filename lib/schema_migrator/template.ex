defmodule SchemaMigrator.Template do
  require Mix.Generator

  import SchemaMigrator.Utils, only: [parse_repo: 1]

  @ecto_types [Ecto.Date,
               Ecto.Time,
               Ecto.DateTime,
               Ecto.UUID,
               Elixir.Ecto.Date,
               Elixir.Ecto.Time,
               Elixir.Ecto.DateTime,
               Elixir.Ecto.UUID]

  def gen_template({module, schema},repo) do
    template = migration_add_table_template(Map.put(schema, :repo, repo))
    {schema, template}
  end

  defp is_ecto_type(t), do: Enum.member? @ecto_types, t

  # def gen_test_template(assigns), do: test_template assigns

  # Mix.Generator.embed_template :test, """
  # <%= for {k, v} <- @types do %>add :<%= k %>, <%= if is_ecto_type(v), do: "", else: ":" %><%= v %><% end%>
  # """

  # Super ugly: re-write later.
  Mix.Generator.embed_template :migration_add_table, """
    defmodule <%= @repo %>.Migrations.AddTable<%= String.capitalize @source %> do
      use Ecto.Migration

      def change do
        create table("<%= @source %>") do
        <%= for {k, v} <- @types do %>add :<%= k %>, <%= if is_ecto_type(v), do: "", else: ":" %><%= v %>
        <% end%>

          timestamps()
        end
      end
    end
    """
end
