protoCompiler = navono007/proto-compiler:latest

list:=$(shell find ./api -iname "*.proto")
proto_files = $(addprefix repo/, $(list))

generate:
	$(call get_file)
	docker run -v ${PWD}:/repo $(protoCompiler) \
		protoc -Irepo/api -Irepo/third_party \
			--js_out=import_style=commonjs,binary:/repo/out \
			--ts_out=service=true:/repo/out \
			--swagger_out=logtostderr=true:/repo/out/swagger \
			--lint_out=. $(proto_files)
