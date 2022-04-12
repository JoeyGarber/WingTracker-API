#!/bin/sh

API="http://localhost:4741"
URL_PATH="/restaurants"
ID="62559145b29f9dd49b837704"
TOKEN="d2bdbcc219185380b0953d8eb9e154ed"


curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
