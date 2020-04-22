defmodule CurrencyConversion.MixProject do
  use Mix.Project

  def project do
    [
      app: :currency_conversion,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Currency Conversion",
      source_url: "https://github.com/maikkkko1/elixir-currency-converter",
      homepage_url: "https://github.com/maikkkko1/elixir-currency-converter",
      docs: [
        # The main page in the docs
        main: "CurrencyConversion",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {CurrencyConversion.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:hackney, "~> 1.15.2"},
      {:jason, ">= 1.0.0"},
      {:tesla, "~> 1.3.0"},
      {:decimal, "~> 1.0"},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:cowboy, "~> 2.4"},
      {:poison, "~> 3.1"},
      {:plug, "~> 1.6"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
