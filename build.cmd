@ECHO OFF
REM 声明采用UTF-8编码
chcp 65001
echo "请先安装 Golang 和 protoc，然后安装 protoc 插件"

set protoDir=./api
for /r "%protoDir%" %%f in (*.proto) do (
  call :concatFiles "%%f"
)

goto :END

:concatFiles
REM echo :%1
set file=%~n1%~x1
set files=%files% %file%
GOTO :eof

:END
REM echo %files%
set PROTOC_GEN_TS_PATH=%cd%\\node_modules\\.bin\\protoc-gen-ts.cmd

REM Directory to write generated code to
set OUT_DIR="./generated"
set JS_DIR=%OUT_DIR%/js
set GO_DIR=%OUT_DIR%/go
set SWAGGER_DIR=%OUT_DIR%/swagger

mkdir %JS_DIR%
mkdir %GO_DIR%
mkdir %SWAGGER_DIR%

protoc -I%protoDir% -Ithird_party ^
      --plugin="protoc-gen-ts=%PROTOC_GEN_TS_PATH%" ^
      --js_out=import_style=commonjs,binary:%JS_DIR% ^
			--ts_out=service=true:%JS_DIR% ^
      --go_out=plugins=grpc:%GO_DIR% ^
      --grpc-gateway_out=logtostderr=true:%GO_DIR% ^
      --swagger_out=logtostderr=true:%SWAGGER_DIR% ^
      --lint_out=. ^
      %files%
