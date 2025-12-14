#!/usr/bin/env bash
VERSION=${1:-latest}
HOST_FOLDER=${2:-$HOME/Documents/research/ai/gemini}
docker run -it -v "$HOST_FOLDER:/workspace" --name gemini gemini:$VERSION bash

