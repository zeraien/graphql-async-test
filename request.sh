#!/bin/bash
PORT=8000
CONCURRENT_REQUESTS="$(($1+0))"
for (( c=1; c<=$CONCURRENT_REQUESTS; c++ ))
do
  echo "Request $c"
  time curl --silent -o /dev/null --location -g --request GET "http://127.0.0.1:${PORT}/graphql/?query={%20%20allRecipes%20{%20%20%20%20edges%20{%20%20%20%20%20%20node%20{%20%20%20%20%20%20%20%20id%20%20%20%20%20%20}%20%20%20%20}}}" &
done
