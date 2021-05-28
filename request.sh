#!/bin/bash
PORT=8000
time curl -o /dev/null --location -g --request GET "http://127.0.0.1:${PORT}/graphql/?query={%20%20allRecipes%20{%20%20%20%20edges%20{%20%20%20%20%20%20node%20{%20%20%20%20%20%20%20%20id%20%20%20%20%20%20}%20%20%20%20}}}"
