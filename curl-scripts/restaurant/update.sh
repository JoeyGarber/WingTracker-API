#!/bin/bash

API="http://localhost:4741"
URL_PATH="/restaurants"
TOKEN="d2bdbcc219185380b0953d8eb9e154ed"
ID="62559145b29f9dd49b837704"
NAME="Wingstop"
WEBSITE='Test to see if I can change both fields'

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "restaurant": {
      "name": "'"${NAME}"'",
      "website": "'"${WEBSITE}"'"
    }
  }'

echo
