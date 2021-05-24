#!/bin/sh
set -e
unzip /tmp/artifacts/rhoam.zip -d /home/workspace
cd /home/workspace/integreatly-operator-master

# Build the binary
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o rhmi-operator main.go

# Copy run dependencies
mkdir /home/artifact
cp -r templates /home/artifact/templates
cp -r manifests /home/artifact/manifests
cp -r products /home/artifact/products
cp rhmi-operator /home/artifact/rhmi-operator