defmodule Blog.MixFile do
  use Mix.Project

  def project do
    [
      app: :blog,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      applications: [:serum]
    ]
  end

  defp deps do
    [
      {:serum, "~> 1.2"},
      {:serum_theme_essence,
       git: "https://github.com/rasjonell/serum-theme-essence.git", tag: "1.0.2"}
    ]
  end
end
