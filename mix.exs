defmodule HTTPlaster.Mixfile do
  use Mix.Project

  @project_description """
  HTTPlaster is an adapter-driven HTTP library for Elixir that provides a way
  to build composable HTTP requests.
  """

  @source_url "https://github.com/davidantaramian/httplaster"
  @version "0.0.1"

  def project do
    [
      app: :httplaster,
      name: "HTTPlaster",
      version: @version,
      elixir: "~> 1.3",
      description: @project_description,
      source_url: @source_url,
      homepage_url: @source_url,
      package: package(),
      deps: deps(),
      docs: docs(),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod
    ]
  end

  def application() do
    [
      env: [httplaster: [adapter: HTTPlaster.Adapters.Unimplemented]],
      applications: [:logger]
    ]
  end

  defp docs() do
    [
      source_ref: "v#{@version}",
      main: "HTTPlaster",
      extras: [
        "README.md": [title: "README"]
      ]
    ]
  end

  defp package() do
    [
      name: :httplaster,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["David Antaramian"],
      licenses: ["ISC"],
      links: %{
        "GitHub" => @source_url,
        "Documentation" => "https://hexdocs.pm/httplaster/readme.html"
      }
    ]
  end


  defp deps do
    [
      {:earmark, "~> 1.0", only: [:dev, :docs]},
      {:ex_doc, "~> 0.13", only: [:dev, :docs]}
    ]
  end
end