#!/bin/bash

API="http://localhost:4741"
URL_PATH="/restaurants"

NAME="It's Angry"
WEBSITE="About null names for wings"
TOKEN="bf041b37cb9e9a97c714bcfa210ab4a2"

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
