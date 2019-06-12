
echo off

REM echo %cd%
REM docker run --rm -v %cd%:%cd% -w %cd% znly/protoc --go_out=plugins=grpc::. -I/bazel-proto/api ./api/thing.proto
REM docker run --rm -v "E://sourcecode//bazel-proto//":"E://sourcecode//bazel-proto//" -w "E://sourcecode//bazel-proto" znly/protoc --go_out=plugins=grpc::. -I/bazel-proto/api ./api/thing.proto

REM docker run --rm -v %cd%:/data -w /data alpine ls

REM list:=$(shell find ./vxsip -iname "*.proto")
REM proto_files = $(addprefix repo/, $(list))

docker run --rm -v %cd%:/data -w /data znly/protoc -Iapi -Ithird_party ^
  --go_out=plugins=grpc:out ^
  --grpc-gateway_out=logtostderr=true:out ^
  --lint_out=. ^
  api/greeter.proto