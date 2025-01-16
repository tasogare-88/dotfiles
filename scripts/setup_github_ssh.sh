#!/bin/bash

mkdir -p ~/.ssh
chmod 700 ~/.ssh

if [ ! -f ~/.ssh/id_rsa ]; then
    echo "Generating GitHub SSH key..."
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N "" -C "$(git config --get user.email)"
fi

chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

echo "Please register the following public key on GitHub:"
echo "----------------------------------------"
cat ~/.ssh/id_rsa.pub
echo "----------------------------------------"
pbcopy < ~/.ssh/id_rsa.pub
echo "Copied to clipboard. Please paste it into GitHub."
open "https://github.com/settings/ssh/new"

echo "Please press Enter to test the connection to GitHub..."
read

echo "Testing connection to GitHub..."
ssh -T git@github.com
