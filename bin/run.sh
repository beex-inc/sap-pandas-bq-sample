#!/bin/bash
cd $(dirname $0)/..
docker run -v $(pwd):/workspace -p 8888:8888 sap-pandas-bq jupyter notebook --ip 0.0.0.0  --allow-root
