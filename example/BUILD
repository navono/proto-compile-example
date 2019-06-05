load("@build_stack_rules_proto//go:go_grpc_compile.bzl", "go_grpc_compile")
load("@build_stack_rules_proto//go:go_grpc_library.bzl", "go_grpc_library")
load("@build_stack_rules_proto//github.com/grpc-ecosystem/grpc-gateway:gateway_grpc_compile.bzl", "gateway_grpc_compile")
load("@io_bazel_rules_go//proto:def.bzl", "go_grpc_library", "go_proto_library")
load("@ts_protoc_gen//:defs.bzl", "typescript_proto_library")

go_grpc_compile(
    name = "example_grpc_proto",
    deps = [
        ":thing_proto",
        ":greeter_proto"
    ],
)

gateway_grpc_compile(
    name = "greeter_grpc",
    deps = [
        ":greeter_proto"
    ],
)

typescript_proto_library(
    name = "greeter_ts_proto",
    proto = ":greeter_proto",
)

proto_library(
    name = "thing_proto",
    srcs = ["thing.proto"],
    visibility = ["//visibility:public"],
    deps = ["@com_google_protobuf//:any_proto"],
)

proto_library(
    name = "greeter_proto",
    srcs = [
        "greeter.proto",
    ],
    visibility = [
        "//visibility:public",
    ],
    deps = [
        "@go_googleapis//google/rpc:status_proto",
        "@go_googleapis//google/api:annotations_proto",
    ],
)