PROTO_DIR = ./pb
OUT_DIR = ./user

gen-proto:
	@mkdir -p $(OUT_DIR)
	protoc --proto_path=$(PROTO_DIR) \
	       --go_out=$(OUT_DIR) --go_opt=paths=source_relative \
	       --go-grpc_out=$(OUT_DIR) --go-grpc_opt=paths=source_relative \
	       $(PROTO_DIR)/*.proto
	
clean-proto:
	rm pb/*.go

.PHONY: gen-proto