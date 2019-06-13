@ECHO OFF
REM 声明采用UTF-8编码
chcp 65001
echo "请先安装 Golang 和 protoc，然后安装 protoc 插件"

set PROTOC_GEN_TS_PATH=%cd%\\node_modules\\.bin\\protoc-gen-ts.cmd

REM Directory to write generated code to
set OUT_DIR="./generated"
set JS_DIR=%OUT_DIR%/js
set GO_DIR=%OUT_DIR%/go
set SWAGGER_DIR=%OUT_DIR%/swagger

mkdir %JS_DIR%
mkdir %GO_DIR%
mkdir %SWAGGER_DIR%


set protoDir=./api
for /r "%protoDir%" %%f in (*.proto) do (
  call :concatFiles "%%f"
)

goto :eof

:concatFiles
REM echo %1

set filepath=%1
REM 删除 vxsip\ 之前的所有字符
set tempfile=%filepath:*bazel-proto\=%
REM 将 \ 替换成 /
set file=%tempfile:\=/%
REM 删除最后一个 "
set file=%file:~0, -1%

protoc -I. -Ithird_party ^
      --plugin="protoc-gen-ts=%PROTOC_GEN_TS_PATH%" ^
      --js_out=import_style=commonjs,binary:%JS_DIR% ^
			--ts_out=service=true:%JS_DIR% ^
      --go_out=plugins=grpc:%GO_DIR% ^
      --grpc-gateway_out=logtostderr=true:%GO_DIR% ^
      --swagger_out=logtostderr=true:%SWAGGER_DIR% ^
      --lint_out=. ^
      %file%
GOTO :eof
