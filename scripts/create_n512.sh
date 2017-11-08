#!/bin/bash
make tools
for i in $(seq -w 0 31); do
    mkdir -p w
    bin/generate_sparse_layer 512 512 > w/n512_${i}.bin;
done

#script genereates 32 layers, each of are 512 wide (512 nodes in each layer)