# load("@build_stack_rules_proto//go:go_proto_library.bzl", "go_proto_library")

# go_proto_library(
#     name = "thing_go_proto",
#     go_deps = ["@com_github_golang_protobuf//ptypes/any:go_default_library",],
#     #  importpath = "github.com/stackb/rules_proto/go/example/go_proto_library/person",
#     importpath = "//go_proto_library/thing",
#     deps = [":thing_proto"],
# )

load("@build_stack_rules_proto//go:go_grpc_compile.bzl", "go_grpc_compile")
load("@build_stack_rules_proto//go:go_grpc_library.bzl", "go_grpc_library")

go_grpc_compile(
    name = "core_proto",
    deps = [
        ":thing_proto",
        ":greeter_grpc"
    ],
)

go_grpc_library(
    name = "core_lib",
    go_deps = [
        "@com_github_golang_protobuf//ptypes/any:go_default_library",
        "@go_googleapis//google/rpc:status_go_proto",
        "@go_googleapis//google/api:annotations_go_proto",
    ],
    importpath = "core/greeter",
    deps = [":greeter_grpc"],
)

proto_library(
    name = "thing_proto",
    srcs = ["thing.proto"],
    visibility = ["//visibility:public"],
    deps = ["@com_google_protobuf//:any_proto"],
)

proto_library(
    name = "greeter_grpc",
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