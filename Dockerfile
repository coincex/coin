# Bước 1: Chọn ảnh cơ sở
FROM node:22-bullseye

# Đặt thư mục làm việc
WORKDIR /app

# Bước 2: Cập nhật và cài đặt Git cùng với Tmate
# Thêm "tmate" vào danh sách cài đặt
RUN apt-get update && apt-get install -y git tmate \
    && rm -rf /var/lib/apt/lists/*

# Bước 3: Clone repository chứa tool của bạn vào thư mục /app
RUN git clone https://github.com/hlounhdepzai/tool .

# Bước 4: Cấp quyền thực thi cho tất cả các file
RUN chmod +x *

# Bước 5: Lệnh mặc định để khởi động Tmate
# Lệnh này sẽ chạy tmate ở chế độ foreground, giữ cho container sống
# và in ra link kết nối SSH trong log deploy của bạn.
CMD ["tmate", "-F"]

