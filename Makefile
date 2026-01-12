# Lệnh dọn dẹp và gen lại từ đầu
gen: clean
	buf generate
	@echo "✅ Đã generate code Go và TS thành công!"

# Lệnh kiểm tra lỗi cú pháp
lint:
	buf lint
	@echo "✅ Tất cả các file proto đều chuẩn chỉnh!"

# Lệnh dọn dẹp thư mục gen
clean:
	rm -rf gen/
	@echo "🧹 Đã dọn dẹp thư mục gen."

# Lệnh kiểm tra breaking changes (so với nhánh main)
check:
	buf breaking --against '.git#branch=main'

api: 
	protoc -I . \
    --openapiv2_out ./gen/openapiv2 \
    --openapiv2_opt logtostderr=true \
    ./geofleet/tracking/v1/tracking.proto
	
.PHONY: gen lint clean