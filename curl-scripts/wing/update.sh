#!/bin/bash

API="http://localhost:4741"
URL_PATH="/wings"
TOKEN="d2bdbcc219185380b0953d8eb9e154ed"
RESTID="62559145b29f9dd49b837704"
WINGID="6255b774e2b6f0e94ce42300"
NAME="Amazing"


curl "${API}${URL_PATH}/${RESTID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "wing": {
      "wingId": "'"${WINGID}"'",
      "name": "'"${NAME}"'",
      "spiciness": "'"${SPICINESS}"'",
      "quality": "'"${QUALITY}"'"
    }
  }'

echo