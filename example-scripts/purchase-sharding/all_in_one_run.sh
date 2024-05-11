#!/bin/bash

shards=$1

cd 'datasets/purchase' || exit
python prepare_data.py
cd ../..

/bin/bash example-scripts/purchase-sharding/init.sh "${shards}"
/bin/bash example-scripts/purchase-sharding/train.sh "${shards}"
/bin/bash example-scripts/purchase-sharding/predict.sh "${shards}"
/bin/bash example-scripts/purchase-sharding/data.sh "${shards}"