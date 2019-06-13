@ECHO OFF

docker run --rm -v %cd%:/data -w /data navono007/proto-compiler /bin/bash ./build.sh
