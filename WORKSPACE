workspace(
    name = "bazel_protocol_buffers",
    managed_directories = {"@npm": ["node_modules"]},
)

# go version for rules_go
GO_VERSION = "1.12.5"

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

http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "bc180118b9e1c7f2b74dc76a8f798d706fe9fc53470ef9296728267b4cd29441",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/0.30.2/rules_nodejs-0.30.2.tar.gz"],
)

http_archive(
    name = "ts_protoc_gen",
    # NOTE: Update these values to the latest version
    sha256 = "718365345d0ffd660863c36f86517b489347cab2abd06fead9c20d2d195f607c",
    strip_prefix = "ts-protoc-gen-987f1766bb717a5dbfb382d4a720386b8eabd54c",
    urls = ["https://github.com/improbable-eng/ts-protoc-gen/archive/987f1766bb717a5dbfb382d4a720386b8eabd54c.zip"],
)

load("@build_bazel_rules_nodejs//:defs.bzl", "yarn_install")
# This runs yarn install, then our generate_build_file.js to create BUILD files
# inside the resulting node_modules directory.
# The name "npm" here means the resulting modules are referenced like
# @npm//jasmine
yarn_install(
    name = "npm",
    package_json = "//:package.json",
    yarn_lock = "//:yarn.lock",
)

load("@npm//:install_bazel_dependencies.bzl", "install_bazel_dependencies")
install_bazel_dependencies()

# Setup TypeScript toolchain
load("@npm_bazel_typescript//:index.bzl", "ts_setup_workspace")
ts_setup_workspace()

# load("@npm_bazel_typescript//:index.bzl", "ts_devserver", "ts_library")

load("@ts_protoc_gen//:defs.bzl", "typescript_proto_dependencies")
typescript_proto_dependencies()


#############################################
load("@build_stack_rules_proto//go:deps.bzl", "go_grpc_compile", "go_grpc_library")
go_grpc_compile()
go_grpc_library()

load("@build_stack_rules_proto//:deps.bzl", "bazel_gazelle", "io_bazel_rules_go")
bazel_gazelle()
io_bazel_rules_go()

load("@build_stack_rules_proto//github.com/grpc-ecosystem/grpc-gateway:deps.bzl", "gateway_grpc_compile")
gateway_grpc_compile()

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
gazelle_dependencies()

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
go_rules_dependencies()
go_register_toolchains(go_version = GO_VERSION)
