#!/bin/bash
cd $(dirname $0)/..
docker build -t sap-pandas-bq .
