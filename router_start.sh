#!/bin/bash

set -ex

router_name='router1'
net_overlay='host'
ff_dir='/Freeflow/'
image_name='gangliao/rdma_dev:centos7.4.1708'

sudo docker run --name $node_name --net $net_overlay \
 -e "FFR_NAME=${router_name}" -e "LD_LIBRARY_PATH=/usr/lib/:/usr/local/lib/:/usr/lib64/" \
 -v /sys/class/:/sys/class/ -v /dev/:/dev/ \
 -v ${ff_dir}:/freeflow/  --privileged \
 -it -d ${image_name} /bin/bash
