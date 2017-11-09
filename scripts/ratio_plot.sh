nIN="128 256 512 1024 2048 4096 8192 16384 32768"
nOUT="32768 16384 8192 4096 2048 1024 512 256 128"
cat /dev/urandom | head -c 1048576 > w/random1M.bin
while [ -n "$nIN" ]
do
    headIN=`echo "$nIN" | cut -d ' ' -f 1`
    listIN=`echo "$nIN" | sed 's/[^ ]* *\(.*\)$/\1/'`
    headOUT=`echo "$nOUT" | cut -d ' ' -f 1`
    listOUT=`echo "$nOUT" | sed 's/[^ ]* *\(.*\)$/\1/'`
    echo $headIN $headOUT
    mkdir -p w
    bin/generate_sparse_layer ${headIN} ${headOUT} > w/n_${headIN}_${headOUT}.bin; 
    time(cat w/random1M.bin | bin/run_network w/n_${headIN}_${headOUT}.bin:simple > /dev/null) 2>> results/simple_ratio.txt
    time(cat w/random1M.bin | bin/run_network w/n_${headIN}_${headOUT}.bin:par_for_naive > /dev/null) 2>> results/naive_ratio.txt
    time(cat w/random1M.bin | bin/run_network w/n_${headIN}_${headOUT}.bin:par_for_atomic > /dev/null) 2>> results/atomic_ratio.txt
    time(cat w/random1M.bin | bin/run_network w/n_${headIN}_${headOUT}.bin:clustered > /dev/null) 2>> results/clustered_ratio.txt
    time(cat w/random1M.bin | bin/run_network w/n_${headIN}_${headOUT}.bin:par_for_clustered > /dev/null) 2>> results/par_for_clustered_ratio.txt
done


