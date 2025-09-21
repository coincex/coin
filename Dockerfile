FROM node:22-bullseye

WORKDIR /app

RUN apt-get update -y && \
    apt-get install -y tmate && \
    rm -rf /var/lib/apt/lists/*

# Start tmate session và giữ container không thoát
CMD tmate -F || true & \
    tail -f /dev/null
