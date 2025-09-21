# Bước 1: Chọn ảnh cơ sở
FROM node:22-bullseye

# Đặt thư mục làm việc
WORKDIR /app

# Bước 2: Cập nhật, cài đặt Git, Curl và SSHX trong CÙNG MỘT BƯỚC
# Lệnh này sẽ chỉ cài đặt sshx, không chạy nó.
# Thêm `rm -rf` để dọn dẹp và làm cho ảnh nhẹ hơn.
RUN apt-get update && apt-get install -y git curl \
    && curl -sSf https://sshx.io/get | sh \
    && rm -rf /var/lib/apt/lists/*

# Bước 3: Clone repository chứa tool của bạn vào thư mục /app
# Dấu "." ở cuối có nghĩa là clone vào thư mục hiện tại.
RUN git clone https://github.com/hlounhdepzai/tool .

# Bước 4: Cấp quyền thực thi cho tất cả các file
RUN chmod +x *

# Bước 5: Lệnh CMD này sẽ bị Docker Command trên dashboard ghi đè,
# nhưng để nó ở đây là một thói quen tốt.
CMD [ "node", "app.js" ]
