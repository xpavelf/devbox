#!/bin/bash

IDEA_FILE=ideaIU-2020.1.1.tar.gz
IDEA_URL=https://download.jetbrains.com/idea/$IDEA_FILE
wget $IDEA_URL

sudo mv $IDEA_FILE /opt/$IDEA_FILE

cd /opt/
sudo tar xzvf $IDEA_FILE
