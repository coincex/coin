# Bước 1: Chọn ảnh cơ sở
FROM node:22-bullseye

# Đặt thư mục làm việc
WORKDIR /app

# Bước 2: Cập nhật và cài đặt Git, Tmate, và openssh-client
# Thêm "openssh-client" để đảm bảo có lệnh ssh-keygen
RUN apt-get update && apt-get install -y git tmate openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Bước 3: Clone repository chứa tool của bạn vào thư mục /app
RUN git clone https://github.com/hlounhdepzai/tool .

# Bước 4: Cấp quyền thực thi cho tất cả các file
RUN chmod +x *

# Bước 5: (MỚI) Tạo trước SSH keys để Tmate không bị lỗi khi khởi động
# Lệnh này sẽ tạo một cặp khóa rỗng mà không cần tương tác.
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -N ""

# Bước 6: (SỬA LỖI) Lệnh mặc định để khởi động Tmate với chế độ log chi tiết (verbose)
# Thêm cờ "-v" để xem log chi tiết, giúp tìm ra nguyên nhân tmate bị thoát.
CMD ["tmate", "-v", "-F"]

