#!/usr/bin/env bash
wrk -c700 -t25 -d20s http://172.18.0.3:8080/file
