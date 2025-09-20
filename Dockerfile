# Bước 1: Chọn ảnh cơ sở có sẵn Node.js v22.
# Cách này tốt hơn nhiều so với việc cài đặt thủ công.
FROM node:22-bullseye

# Đặt thư mục làm việc bên trong container là /app
WORKDIR /app

# Bước 2: Cập nhật và cài đặt git để có thể clone repository
# (sudo không thực sự cần thiết vì ta đang là người dùng root)
RUN apt-get update && apt-get install -y git

# Bước 3: Sao chép (clone) mã nguồn từ repository của bạn vào thư mục /app
RUN git clone https://github.com/hlounhdepzai/tool .

# Bước 4: Cấp quyền thực thi cho các file trong thư mục
RUN chmod +x *

# Bước 5: Lệnh mặc định để khởi động ứng dụng khi container chạy
CMD [ "node", "app.js" ]
