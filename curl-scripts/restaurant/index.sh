#!/bin/sh

API="http://localhost:4741"
URL_PATH="/restaurants"
TOKEN="d2bdbcc219185380b0953d8eb9e154ed"


curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
