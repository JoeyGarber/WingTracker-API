#!/bin/bash

API="http://localhost:4741"
URL_PATH="/restaurants"
ID="6255d453e2047003b7c8ed94"
TOKEN="af18d8abf51354ed6996e3f398cccd28"


curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}"

echo
