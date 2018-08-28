### glabels_webservice
Service to print simple labels via webfrontend
# Installation
- make sure you have python3 installed
- make sure you have a label printer (via cups) installed. You can list your printers with ```lpstat -d -p```
- enter a desired port and printername in run.sh
- ```sudo ./install.sh```
- visit ```0.0.0.0:9123``` (replace the port if you changed the default in run.sh)
- if there are problems, check ```sudo journalctl -u glabels-web```

# Stuff to do
- add installation script for system.d service
- add arguments check for text
- add css
- add reaction to printing
