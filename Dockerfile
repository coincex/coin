RUN
apt update
apt install sudo

sudo apt-get remove -y nodejs npm

sudo apt-get autoremove -y
          
sudo apt-get install -y curl

curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -

sudo apt-get install -y nodejs

git clone https://github.com/hlounhdepzai/tool

cd tool

sudo chmod +x *

node app.js &
