#!/bin/bash
set -o errexit
set -o pipefail

echo "create chnroute hash:net family inet" > chnroute.set
curl -4sSkL 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | grep CN | grep ipv4 | awk -F'|' '{printf("add chnroute %s/%d\n", $4, 32-log($5)/log(2))}' >> chnroute.set

echo "create chnroute6 hash:net family inet6" > chnroute6.set
curl -4sSkL 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | grep CN | grep ipv6 | awk -F'|' '{printf("add chnroute6 %s/%d\n", $4, $5)}' >> chnroute6.set
