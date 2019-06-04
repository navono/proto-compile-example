workspace(name = "example")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
  name = "build_stack_rules_proto",
  urls = ["https://github.com/stackb/rules_proto/archive/56665373fe541d6f134d394624c8c64cd5652e8c.tar.gz"],
  sha256 = "78e378237c6e7bd7cfdda155d4f7010b27723f26ebfa6345e79675bddbbebc11",
  strip_prefix = "rules_proto-56665373fe541d6f134d394624c8c64cd5652e8c",
)

http_archive(
    name = "io_bazel_rules_go",
    url = "https://github.com/bazelbuild/rules_go/releases/download/0.18.5/rules_go-0.18.5.tar.gz",
    sha256 = "a82a352bffae6bee4e95f68a8d80a70e87f42c4741e6a448bec11998fcc82329",
)

# For cpp
# load("@build_stack_rules_proto//cpp:deps.bzl", "cpp_proto_compile")
# cpp_proto_compile()


# For Go proto files
# load("@build_stack_rules_proto//go:deps.bzl", "go_proto_compile")
# go_proto_compile()

# For Go proto lib
# load("@build_stack_rules_proto//go:deps.bzl", "go_proto_library")
# go_proto_library()

load("@build_stack_rules_proto//go:deps.bzl", "go_grpc_compile")
go_grpc_compile()

load("@build_stack_rules_proto//go:deps.bzl", "go_grpc_library")
go_grpc_library()

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
go_rules_dependencies()
go_register_toolchains()
