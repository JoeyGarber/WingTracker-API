#!/bin/bash

API="http://localhost:4741"
URL_PATH="/restaurants"

NAME="Wingos"
WEBSITE="www.wingos.com"
TOKEN="d2bdbcc219185380b0953d8eb9e154ed"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "restaurant": {
      "name": "'"${NAME}"'",
      "website": "'"${WEBSITE}"'"
    }
  }'

echo
