#! /bin/bash
# build.sh

PROTOC_GEN_TS_PATH=$(pwd)/node_modules/.bin/protoc-gen-ts.cmd

# Directory to write generated code to
OUT_DIR="./generated"
JS_DIR=$OUT_DIR/js
GO_DIR=$OUT_DIR/go
SWAGGER_DIR=$OUT_DIR/swagger

mkdir -p $JS_DIR
mkdir -p $GO_DIR
mkdir -p $SWAGGER_DIR

function compile {
  
  for file in $1/*
  do
    if [ -d "$file" ]; then
			compile $file
    else
      ##check for the file
			ext="${file##*.}"
			if [[ -f "$file" ]] && [[ "$ext" = "proto" ]] ; then
				protoc -I. -Ithird_party \
          --js_out=import_style=commonjs,binary:$JS_DIR \
          --ts_out=service=true:$JS_DIR \
          --go_out=plugins=grpc:$GO_DIR \
          --grpc-gateway_out=logtostderr=true:$GO_DIR \
          --swagger_out=logtostderr=true:$SWAGGER_DIR \
          --lint_out=. $file
			fi
    fi
  done
}

echo "proto files compiling..."
compile ./api
