FROM node:22-bullseye

WORKDIR /app

RUN apt-get update -y && \
    apt-get install -y tmate curl && \
    rm -rf /var/lib/apt/lists/*

# fake server để Render detect PORT
EXPOSE 10000

CMD tmate -F || true & \
    (while true; do echo "HTTP/1.1 200 OK\n\nRunning" | nc -l -p 10000; done)
