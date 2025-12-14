#!/usr/bin/env bash
VERSION=${1:-latest}
docker build -t gemini:$VERSION .

