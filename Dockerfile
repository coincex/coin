FROM node:22-bullseye

WORKDIR /app

# Cài tmate
RUN apt-get update -y && \
    apt-get install -y tmate && \
    rm -rf /var/lib/apt/lists/*

# Start tmate với SSH (foreground)
CMD ["tmate", "-F"]
