#!/usr/bin/env bash
# Script that configures Nginx server with some folders and files

if ! command -v nginx &> /dev/null
then
	    sudo apt-get -y update
	        sudo apt-get -y upgrade
		    sudo apt-get -y install nginx
fi

sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/
echo "Holberton School" | sudo tee /data/web_static/releases/test/index.html

conf="\\\n\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}"
sudo tee -a /etc/nginx/sites-available/default <<< "$conf"

sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/

sudo service nginx restart
sudo service nginx reload

exit 0

