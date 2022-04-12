#!/bin/bash

API="http://localhost:4741"
URL_PATH="/wings"
TOKEN="d2bdbcc219185380b0953d8eb9e154ed"
RESTID="62559145b29f9dd49b837704"
WINGID="62559fe0a994c7d9ec0c2d08"


curl "${API}${URL_PATH}/${RESTID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "wing": {
      "wingId": "'"${WINGID}"'"
    }
  }'

echo