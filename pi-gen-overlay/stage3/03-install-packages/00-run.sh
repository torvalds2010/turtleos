#!/bin/bash -e

on_chroot <<-EOF
    echo "=> Retrieving latest TCS..."
    curl -L $(curl --silent 'https://api.github.com/repos/TurtleRover/tcs/releases/latest' | jq '.assets[0].browser_download_url') --output /tmp/tcs.deb

    apt install /tmp/tcs.deb

    echo "=> Removing deb..."
    rm /tmp/tcs.deb
EOF
