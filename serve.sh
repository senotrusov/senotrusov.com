#!/usr/bin/env bash
set -ue

if [ ! -d .venv ]; then
  uv venv --relocatable
fi
uv sync
source .venv/bin/activate
zensical serve
