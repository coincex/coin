# Bước 1: Bắt đầu từ một ảnh Ubuntu 22.04 LTS (Jammy Jellyfish) cơ sở.
FROM ubuntu:22.04

# Bước 2: Cập nhật và cài đặt các gói cơ bản wget và curl.
# Dọn dẹp bộ nhớ đệm của apt để giữ cho ảnh gọn nhẹ.
RUN apt-get update -y && \
    apt-get install -y wget curl && \
    rm -rf /var/lib/apt/lists/*

# Bước 3: Lệnh để giữ cho container chạy vô tận.
# Lệnh "sleep infinity" sẽ ngăn container tự động thoát ra sau khi khởi động,
# cho phép bạn truy cập vào shell bất cứ lúc nào.
CMD ["sleep", "infinity"]

