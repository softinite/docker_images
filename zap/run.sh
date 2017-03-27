#!/usr/bin/env bash
echo "Zap webswing has been started. Please point your browser to http://<ZAP_IP>:8080/?anonym=true&app=ZAP"
docker run --name zap -u zap -p 8008:8080 -p 8090:8090 -i owasp/zap2docker-stable zap-webswing.sh -daemon -port 8090 -host 0.0.0.0
