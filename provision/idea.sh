#!/bin/bash

IDEA_FILE=ideaIU-2020.3.3.tar.gz
IDEA_URL=https://download.jetbrains.com/idea/$IDEA_FILE
wget $IDEA_URL

sudo mv $IDEA_FILE /opt/$IDEA_FILE

cd /opt/
sudo tar xzvf $IDEA_FILE
sudo rm $IDEA_FILE
