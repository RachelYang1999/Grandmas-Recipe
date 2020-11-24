#! /usr/bin/env bash

apt-get update
pip3 install -r /app/backend/requirements.txt
cp /app/settings.py /app/backend/app_3609/
