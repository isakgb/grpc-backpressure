defmodule GrpcBackpressure.MixProject do
  use Mix.Project

  def project do
    [
      app: :grpc_backpressure,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {GrpcBackpressure.Application, []}
    ]
  end

  defp deps do
    [
      {:grpc, "~> 0.11.5"},
      {:protobuf, "~> 0.16.0"}
    ]
  end
end
