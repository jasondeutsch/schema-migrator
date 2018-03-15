defmodule SchemaMigrator.Template do
  require Mix.Generator

  import SchemaMigrator.Utils, only: [parse_repo: 1, parse_module: 1]

  @ecto_types [Ecto.UUID,
               Elixir.Ecto.UUID]

  @deprecated_ecto_types [Ecto.Date,
                          Elixir.Ecto.Date,
                          Ecto.DateTime,
                          Elixir.Ecto.DateTime,
                          Ecto.Time,
                          Elixir.Ecto.Time]

  def gen_template({module, schema},repo) do
    assigns =
      schema
      |> Map.put(:repo, repo)
      |> Map.put(:module, module)
      |> replace_invalid_types

    IO.inspect assigns

    template = add_table_template assigns

    {module, template}
  end

  defp is_ecto_type(t), do: Enum.member? @ecto_types, t

  defp replace_invalid_types(schema) do
    {_, valid_schema} =
      Map.get_and_update(schema, :types,
        fn ts -> {ts, Enum.map(ts, fn {k, v} -> {k, to_valid_type(v)} end)}end)

    valid_schema
  end

  defp to_valid_type(Ecto.Date), do: :date
  defp to_valid_type(Elixir.Ecto.Date), do: :date
  defp to_valid_type(Ecto.DateTime), do: :naive_datetime
  defp to_valid_type(Elixir.Ecto.DateTime), do: :naive_datetime
  defp to_valid_type(Ecto.Time), do: :time
  defp to_valid_type(Elixir.Ecto.Time), do: :time
  defp to_valid_type(t), do: t

  # Super ugly: re-write later.
  # Creating a table:
  Mix.Generator.embed_template :add_table, """
    defmodule <%= @repo %>.Migrations.Add<%= parse_module(@module) %>ToTable<%= String.capitalize @source %> do
      use Ecto.Migration

      def change do
        create_if_not_exists table("<%= @source %>")

          alter table("<%= @source %>") do
          <%= for {k, v} <- @types do %>add :<%= k %>, <%= if is_ecto_type(v), do: "", else: ":" %><%= v %>
          <% end%>

          timestamps
        end
      end
    end
    """
end
