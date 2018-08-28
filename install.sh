#!/usr/bin/env bash

sudo apt-get update
sudo apt-get purge glabels
sudo apt-get build-dep glabels
sudo apt-get install -y checkinstall unp build-essential git
sudo apt-get install -y libgtk2.0-dev libgnomeui-dev libxml2-dev libglade2-dev libebook1.2-dev gtk-doc-tools libyelp-dev yelp-tools librsvg2-dev
cd
rm -rf glabels
git clone https://github.com/GNOME/glabels.git
cd glabels/
./autogen.sh
make
sudo make install
sudo ldconfig /usr/local/lib
glabels-3-batch --help
