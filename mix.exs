defmodule PagseguroEx.Mixfile do
  use Mix.Project

  def project do
    [app: :pagseguro_ex,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package,
     description: description,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  defp description do
    """
      Pagseguro Elixir wrapper
    """
  end

  defp package do
    [
      name: :pagseguro_ex,
      files: ["lib", "mix.exs", "README.md","LICENSE"],
      maintainers: ["Nando Sousa"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/kuruminapp/pagseguro_ex",
               "Docs" => "https://hexdocs.pm/pagseguro_ex/"}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end
end

