#!/bin/bash

packages=(
   ruby-full
   ruby-bundler
   build-essential
)

apt update

for i in "${packages[@]}"
do
    apt install -y $i
done
