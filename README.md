> bazel build --package_path %workspace%:/example/proto:thing_proto

> bazel build //example/proto:cpp_thing_proto

> bazel build :thing_cpp_proto