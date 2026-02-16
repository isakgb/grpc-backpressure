# GrpcBackpressure

How to trigger backpressure issue.

### Install

```
mix deps.get
```

### Run

```
iex -S mix
```

From the root directory of the repo with `grpcurl` installed:

```sh
grpcurl -plaintext -import-path $(pwd) -proto priv/protos/numbers.proto -d '{}' localhost:50051 "GrpcBackpressure.Numbers.GetNumbers" | less
```

Watch memory usage grow.
