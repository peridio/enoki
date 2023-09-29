defmodule PeridioSDK.MixProject do
  use Mix.Project

  def project do
    [
      app: :peridio_sdk,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:castore, "~> 1.0"},
      {:slipstream, "~> 1.0"},
      {:jason, "~> 1.0"},
      {:tesla, "~> 1.7"},
      {:mint, "~> 1.5"}
    ]
  end
end
