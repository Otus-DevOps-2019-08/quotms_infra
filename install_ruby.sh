#!/bin/bash

packages=(
   ruby-full
   ruby-bundler
   build-essential
)

sudo apt update
for i in "${packages[@]}"
do
    sudo apt install -y $i
done
