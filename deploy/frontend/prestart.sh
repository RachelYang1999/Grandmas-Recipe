#! /usr/bin/env bash

apt-get update
pip3 install -r /app/frontend/requirements.txt
cp /app/config.ini /app/frontend/config.ini
