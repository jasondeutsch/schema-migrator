defmodule SchemaMigrator.Template do
  require Mix.Generator

  import SchemaMigrator.Utils, only: [parse_repo: 1]

  def gen_template({module, schema},repo) do
    template = migration_add_table_template(Map.put(schema, :repo, repo))
    {schema, template}
  end

  Mix.Generator.embed_template :migration_add_table, """
    defmodule <%= @repo %>.Migrations.AddTable<%= String.capitalize @source %> do
      use Ecto.Migration

      def change do
        create table("<%= @source %>") do
          <%= for {k, v} <- @types do %>
            add :<%= k %>, :<%= v %>
          <% end%>

          timestamps()
        end
      end
    end
    """
end
