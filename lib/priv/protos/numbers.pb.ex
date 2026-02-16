defmodule GrpcBackpressure.Request do
  @moduledoc false

  use Protobuf,
    full_name: "GrpcBackpressure.Request",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule GrpcBackpressure.Response do
  @moduledoc false

  use Protobuf,
    full_name: "GrpcBackpressure.Response",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :number, 1, type: :int64
end

defmodule GrpcBackpressure.Numbers.Service do
  @moduledoc false

  use GRPC.Service, name: "GrpcBackpressure.Numbers", protoc_gen_elixir_version: "0.16.0"

  rpc :GetNumbers, GrpcBackpressure.Request, stream(GrpcBackpressure.Response)
end

defmodule GrpcBackpressure.Numbers.Stub do
  @moduledoc false

  use GRPC.Stub, service: GrpcBackpressure.Numbers.Service
end
