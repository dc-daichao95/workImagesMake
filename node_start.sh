#!/bin/bash

set -ex 

num=$1
node_name='node'${num}
router_name='router1'
net_overlay='weave'
FFR_ID_ENV="FFR_ID=10"
ff_dir='/Freeflow/'
image_name='gangliao/rdma_dev:centos7.4.1708'

sudo docker run --name $node_name --net $net_overlay \
 -e "FFR_NAME=${router_name}" -e "$FFR_ID_ENV" -e "LD_LIBRARY_PATH=/usr/lib" \
 --ipc=container:${router_name} \
 -v /sys/class/:/sys/class/ -v /dev/:/dev/ \
 -v ${ff_dir}:/freeflow/  --privileged \
 --device=/dev/infiniband/uverbs0 --device=/dev/infiniband/rdma_cm \
 -it -d ${image_name} /bin/bash
