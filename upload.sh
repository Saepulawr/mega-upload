#!/bin/bash

set -e

#bash -c  "nohup tail -f /root/.megaCmd/megacmdserver.log >&0 2>1" &

if [ -z "${USERNAME}" ]; then
  echo "Mega username must be provided as USERNAME environment variable"
  return 1
fi
if [ -z "${PASSWORD}" ]; then
  echo "Mega password must be provided as PASSWORD environment variable"
  return 1
fi
if [ -z "${UPLOADPATH}" ]; then
  echo "Mega upload path must be provided as UPLOADPATH environment variable"
  return 1
fi

mega-login "${USERNAME}" "${PASSWORD}"
mega-put -c "$1" "${UPLOADPATH}"
echo "Save url to output-export.log"
mega-export -a -f "/${UPLOADPATH}" | awk '{print $3}' >> output-export.log

mega-logout
