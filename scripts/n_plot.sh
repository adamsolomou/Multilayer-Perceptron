N="16 32 64 128 256 512 1024 2048 4096 8192 16384 32768"
cat /dev/urandom | head -c 1048576 > w/random1M.bin
for n in $N; do
	mkdir -p w
	bin/generate_sparse_layer ${n} ${n} > w/n_${n}_${n}.bin;
	time(cat w/random1M.bin | bin/run_network w/n_${n}_${n}.bin:simple > /dev/null) 2>> results/simple_n.txt
	time(cat w/random1M.bin | bin/run_network w/n_${n}_${n}.bin:par_for_naive > /dev/null) 2>> results/naive_n.txt
	time(cat w/random1M.bin | bin/run_network w/n_${n}_${n}.bin:par_for_atomic > /dev/null) 2>> results/atomic_n.txt
	time(cat w/random1M.bin | bin/run_network w/n_${n}_${n}.bin:clustered > /dev/null) 2>> results/clustered_n.txt
	time(cat w/random1M.bin | bin/run_network w/n_${n}_${n}.bin:par_for_clustered > /dev/null) 2>> results/par_for_clustered_n.txt
done 
