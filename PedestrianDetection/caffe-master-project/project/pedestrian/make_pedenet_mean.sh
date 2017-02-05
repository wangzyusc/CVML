#!/usr/bin/env sh
# Compute the mean image from the imagenet training lmdb
# N.B. this is available in data/ilsvrc12

EXAMPLE=project/pedestrian/newdata
DATA=data/pedestrian
TOOLS=build/tools

$TOOLS/compute_image_mean $EXAMPLE/pedenet_train_lmdb \
  $DATA/pedenet_mean.binaryproto

echo "Done."
