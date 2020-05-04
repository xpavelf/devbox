#!/bin/sh
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install xubuntu-core^ libexo-1-0
sudo VBoxClient --checkhostversion
sudo VBoxClient --clipboard
sudo VBoxClient --display
sudo VBoxClient --draganddrop
sudo VBoxClient --seamless
