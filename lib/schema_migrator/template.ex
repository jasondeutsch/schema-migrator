defmodule SchemaMigrator.Template do
  require Mix.Generator

  def gen_template(contents) do
    migration_add_table_template contents
  end


  Mix.Generator.embed_template :migration_add_table, """
    defmodule <%= @source %>.addTable<%= String.capitalize @source %> do
      use Ecto.Migration

      def change do
        create table(<%= @source %>) do
          <%= for {k, v} <- @types do %>
            add <%= k %>, <%= v %>
          <% end%>

          timestamps()
        end
      end
    end

    """
end
