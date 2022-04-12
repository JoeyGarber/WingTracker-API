#!/bin/bash

API="http://localhost:4741"
URL_PATH="/restaurants"
ID="625590abb29f9dd49b837702"
TOKEN="d2bdbcc219185380b0953d8eb9e154ed"


curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}"

echo
