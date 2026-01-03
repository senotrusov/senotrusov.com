#!/usr/bin/env bash

# Treat unset variables as errors
set -o nounset

run_zensical () {
  if [ ! -d .venv ]; then
    uv venv --relocatable || {
      echo "Error: Unable to create the Python virtual environment." >&2
      return 1
    }
  fi

  uv sync || {
    echo "Error: Dependency synchronization failed." >&2
    return 1
  }

  source .venv/bin/activate || {
    echo "Error: Failed to activate the virtual environment." >&2
    return 1
  }

  zensical serve --dev-addr 0.0.0.0:8000 --open || {
    echo "Error: The Zensical server failed to start." >&2
    return 1
  }
}

run_zensical || {
  echo "Error: Failed to start the development server." >&2
  echo "Suggestion: Remove cached files and the virtual environment, then try again:" >&2
  echo "  rm -rf .cache .venv" >&2
  exit 1
}
