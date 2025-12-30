#!/usr/bin/env bash
set -ue

if [ ! -d .venv ]; then
  uv venv --relocatable
fi

uv sync
source .venv/bin/activate
zensical serve --dev-addr 0.0.0.0:8000 --open
