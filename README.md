### glabels_webservice
Service to print simple labels via webfrontend
# Installation
- make sure you have python3 and pip installed
- ```pip install -r requirements.txt```
- make sure you have a label printer (via cups) installed. You can list your printers with ```lpstat -d -p```
- test the app with ```python3 app.py --port 8085 --printer YOURPRINTER``` and go to 0.0.0.0:8085

# Stuff to do
- add installation script for system.d service
- add arguments check for text
- add css
- add reaction to printing
