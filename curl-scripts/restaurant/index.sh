#!/bin/sh

API="http://localhost:4741"
URL_PATH="/restaurants"
TOKEN="3b908ffee95862307718a0a3357a7692"


curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
