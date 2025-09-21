# Bước 1: Chọn ảnh cơ sở
FROM node:22-bullseye

# Đặt thư mục làm việc
WORKDIR /app

# Bước 2: Cập nhật và cài đặt Git
RUN apt-get update && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

# Bước 3: Clone repository chứa tool của bạn vào thư mục /app
RUN git clone https://github.com/hlounhdepzai/tool .

# Bước 4: Cấp quyền thực thi cho tất cả các file
RUN chmod +x *

# Bước 5: Lệnh mặc định để khởi động ứng dụng khi container chạy
# Lệnh này sẽ được thực thi để chạy ứng dụng của bạn.
CMD [ "node", "app.js" ]

