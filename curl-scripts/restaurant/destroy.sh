#!/bin/bash

API="http://localhost:4741"
URL_PATH="/restaurants"
ID="6255e3857881ce162c633591"
TOKEN="137ab885299f8c5b5d5b563a7712e0e2"


curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}"

echo
