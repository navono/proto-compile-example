load("@build_stack_rules_proto//go:go_proto_library.bzl", "go_proto_library")

go_proto_library(
    name = "thing_go_proto",
    go_deps = ["@com_github_golang_protobuf//ptypes/any:go_default_library",],
    #  importpath = "github.com/stackb/rules_proto/go/example/go_proto_library/person",
    importpath = "//go_proto_library/thing",
    deps = [":thing_proto"],
)

proto_library(
    name = "thing_proto",
    srcs = ["thing.proto"],
    visibility = ["//visibility:public"],
    deps = ["@com_google_protobuf//:any_proto"],
)
