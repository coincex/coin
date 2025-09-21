FROM node:22-bullseye

WORKDIR /app

RUN sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:tmate.io/archive
sudo apt-get update
sudo apt-get install -y tmate

CMD ["tmate"]

