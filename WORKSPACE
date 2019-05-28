load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
  name = "build_stack_rules_proto",
  urls = ["https://github.com/stackb/rules_proto/archive/56665373fe541d6f134d394624c8c64cd5652e8c.tar.gz"],
  sha256 = "78e378237c6e7bd7cfdda155d4f7010b27723f26ebfa6345e79675bddbbebc11",
  strip_prefix = "rules_proto-56665373fe541d6f134d394624c8c64cd5652e8c",
)

# For cpp
# load("@build_stack_rules_proto//cpp:deps.bzl", "cpp_proto_compile")
# cpp_proto_compile()


# For Go
load("@build_stack_rules_proto//go:deps.bzl", "go_proto_compile")
go_proto_compile()

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
go_rules_dependencies()
go_register_toolchains()