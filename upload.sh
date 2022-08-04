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
if [ -z "${UPLOADFROM}" ]; then
  echo "Variable UPLOADFROM is required!"
  return 1
fi
if [ -z "${UPLOADTO}" ]; then
  echo "Variable UPLOADTO is required!"
  return 1
fi

mega-login "${USERNAME}" "${PASSWORD}"
mega-put -c "${UPLOADFROM}" "${UPLOADTO}"
# mega-export -a -f "/$1" | awk '{print "::set-output name=url::"$3}'
mega-export -a -f "/${UPLOADTO}"
mega-export -a -f "/${UPLOADTO}" | awk '{print $4}'
mega-logout
