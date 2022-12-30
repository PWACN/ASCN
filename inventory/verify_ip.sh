#!/bin/bash

external_ip=""

while [ -z $external_ip ]; do
  external_ip=$(kubectl get svc $1 --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}")
  [ -z "$external_ip" ] && sleep 5
done

echo $external_ip