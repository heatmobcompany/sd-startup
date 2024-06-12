#!/bin/bash

cd /workspace
source venv/bin/activate
pip install jupyterlab
jupyter-lab --ip 0.0.0.0 --no-browser --allow-root
