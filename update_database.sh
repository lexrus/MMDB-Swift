#!/usr/bin/env sh

set -e

echo "Updating GeoIP database."

tmpfile=$(mktemp)

curl -o $tmpfile http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz

gzcat $tmpfile > $(dirname $0)/MMDB/GeoLite2-Country.mmdb

echo "Updated GeoIP database."



