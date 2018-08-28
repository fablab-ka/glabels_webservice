#!/usr/bin/env bash

apt-get update
apt-get install -y python3-bottle
apt-get purge glabels
apt-get build-dep glabels
apt-get install -y checkinstall unp build-essential git
apt-get install -y libgtk2.0-dev libgnomeui-dev libxml2-dev libglade2-dev libebook1.2-dev gtk-doc-tools libyelp-dev yelp-tools librsvg2-dev
cd
rm -rf glabels
git clone https://github.com/GNOME/glabels.git
cd glabels/
./autogen.sh
make
make install
ldconfig /usr/local/lib
glabels-3-batch --help

echo "[Unit]
Description=Simple Label Printer
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory="$PWD"
ExecStart= "$PWD"/run.sh

[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/glabels-web.service

systemctl enable glabels-web.service
systemctl start glabels-web.service