#!/bin/bash

API="http://localhost:4741"
URL_PATH="/restaurants"
TOKEN="d2bdbcc219185380b0953d8eb9e154ed"
ID="62559145b29f9dd49b837704"
NAME="Wing Stop"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "restaurant": {
      "name": "'"${NAME}"'"
    }
  }'

echo
