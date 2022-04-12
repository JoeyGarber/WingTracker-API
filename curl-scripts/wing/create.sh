#!/bin/bash

API="http://localhost:4741"
URL_PATH="/wings"
TOKEN="d2bdbcc219185380b0953d8eb9e154ed"
RESTID="62559145b29f9dd49b837704"
NAME="Abusive"
SPICINESS="8"
QUALITY="10"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "wing": {
      "name": "'"${NAME}"'",
      "spiciness": "'"${SPICINESS}"'",
      "quality": "'"${QUALITY}"'",
      "restaurantId": "'"${RESTID}"'"
    }
  }'

echo
