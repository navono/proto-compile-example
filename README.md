# bazel_example

## dev(windows)

- install [bazel](https://github.com/bazelbuild/bazel/releases)
- install [ms buiuld tools](https://visualstudio.microsoft.com/zh-hans/downloads/?rr=https%3A%2F%2Fwww.google.com%2F), then set env with:

  > set BAZEL_VS=C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools
  >
  > set BAZEL_VC=C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\VC

  or
  > export BAZEL_VS="C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools"
  >
  > export BAZEL_VC="C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\VC"


## build
build with bazel:

> ./build.sh
