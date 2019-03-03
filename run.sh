#!/bin/bash

export PYTHONPATH='.'
source env/bin/activate
python3 app.py --port 9123 --printer cab_EOS1_300
