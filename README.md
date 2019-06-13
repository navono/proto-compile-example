# proto_compile_exxmple

`proto` 文件编译示例。

## Prerequisite

### 本地主机编译

- Install `Golang`
- Install `Nodejs` and `Yarn`
- Install `bazel` (可选)
- Download `protoc` from [Github](https://github.com/protocolbuffers/protobuf/releases)
- Install plugins
  > go get -u -v github.com/ckaznocha/protoc-gen-lint
  >
  > go get -d -u github.com/golang/protobuf/protoc-gen-go
  >
  > go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
  >
  > go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
  >
  > yarn

### Docker 编译

安装 `Docker`，同时连接网络。运行：
> ./dockerBuild.cmd

## 文件布局

使用 `API` 的工程默认为 `Go` 工程，同时使用 `Go Module` 进行模块管理。因此此处 `API` 的根目录应该与 `Go` 工程的模块名相同，否则会导致在 `Go` 工程在编译时，无法正确加载 `API` 相关的模块。例如：
> `are` 项目的接口统一放置在此目录下的一个名为 `are` 的目录的 `api` 文件夹内。`proto` 文件编译后，`Go` 的导入也就是这样：
>> import (
	v1alpha "are/api/core/v1alpha"
)
>
> 因此要将在 `generated` 下的 `are\api` 整个文件夹拷贝到模块名为 `are` 的工程中。
>


## build
> ./build.sh

## note

注意，`googleapis` 的 `proto` 文件和 `Go` 相应的在 `@go_googleapis` 包下面。由 `@io_bazel_rules_go` 的 `go_rules_dependencies` 进行注册。
