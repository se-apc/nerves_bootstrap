defmodule Mix.Nerves.IO do
  @app Mix.Project.config()[:app]

  @moduledoc false

  def debug_info(header, text \\ "", loc \\ @app) do
    if System.get_env("NERVES_DEBUG") == "1" do
      shell_info(header, text, loc)
    end

    :ok
  end

  def shell_info(header, text \\ "", loc \\ @app) do
    Mix.shell().info([:inverse, "|#{loc}| #{header}", :reset])
    Mix.shell().info(text)
  end

  def shell_warn(header, text \\ "", loc \\ @app) do
    Mix.shell().error([:inverse, :red, "|#{loc}| #{header}", :reset])
    Mix.shell().error(text)
  end

  def nerves_env_info() do
    Mix.shell().info([
      :green,
      """

      Nerves environment
        MIX_TARGET:   #{System.get_env("MIX_TARGET") || "unset"}
        MIX_ENV:      #{Mix.env()}
      """,
      :reset
    ])
  end
end
