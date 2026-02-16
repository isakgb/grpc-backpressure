defmodule GrpcBackpressure.Server do
  @moduledoc false
  use GRPC.Server, service: GrpcBackpressure.Numbers.Service

  alias GrpcBackpressure.{Request, Response}

  @spec get_numbers(Request.t(), GRPC.Server.Stream.t()) :: any()
  def get_numbers(_request, materializer) do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.map(fn number ->
      %Response{number: number}
    end)
    |> GRPC.Stream.from(max_demand: 10)
    |> GRPC.Stream.run_with(materializer)
  end
end
