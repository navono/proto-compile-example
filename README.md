# bazel-proto

## dev(windows)
install [ms buiuld tools](https://visualstudio.microsoft.com/zh-hans/downloads/?rr=https%3A%2F%2Fwww.google.com%2F), then set env with:

> set BAZEL_VS=C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\BuildTools
>
> set BAZEL_VC=C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\BuildTools\VC

or
> export BAZEL_VS="C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools"
>
> export BAZEL_VC="C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\VC"


then, build with bazel:

> bazel --batch build -c fastbuild //proto/...
> 
> bazel build --package_path %workspace%:/example/proto:thing_proto
>
> bazel build //example/proto:cpp_thing_proto
>
> bazel build :thing_go_proto