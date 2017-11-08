#!/bin/bash
#Added in order to accommodate operation in a fresh environment (e.g AWS)
mkdir bin 
make tools
make 

for i in $(seq -w 0 31); do
    mkdir -p w
    bin/generate_sparse_layer 512 512 > w/n512_${i}.bin;
done
