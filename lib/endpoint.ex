defmodule GrpcBackpressure.Endpoint do
  @moduledoc false
  use GRPC.Endpoint

  intercept(GRPC.Server.Interceptors.Logger)
  run(GrpcBackpressure.Server)
end
