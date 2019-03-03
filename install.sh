#!/usr/bin/env bash

python3 -m pip install --user --upgrade pip
python3 -m pip install --user virtualenv

python3 -m virtualenv env
source env/bin/activate

pip install -r requirements.txt

deactivate


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

systemctl daemon-reload
systemctl enable glabels-web.service
systemctl start glabels-web.service