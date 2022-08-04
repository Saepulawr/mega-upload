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
if [ -z "${UPLOAD-FROM}" ]; then
  echo "Variable UPLOAD-FROM is required!"
  return 1
fi
if [ -z "${UPLOAD-TO}" ]; then
  echo "Variable UPLOAD-TO is required!"
  return 1
fi

mega-login "${USERNAME}" "${PASSWORD}"
mega-put -c "${UPLOAD-FROM}" "${UPLOAD-TO}"
# mega-export -a -f "/$1" | awk '{print "::set-output name=url::"$3}'
mega-export -a -f "/${UPLOAD-TO}"
mega-export -a -f "/${UPLOAD-TO}" | awk '{print $4}'
mega-logout
