nIN="128 256 512 1024 2048 4096 8192 16384 32768"
nOUT="32768 16384 8192 4096 2048 1024 512 256 128"
cat /dev/urandom | head -c 1048576 > w/random1M.bin

bin/generate_sparse_layer 128 32768 > w/n_128_32768.bin; 
time(cat w/random1M.bin | bin/run_network w/n_128_32768.bin:simple > /dev/null) 2>> results/simple_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_128_32768.bin:par_for_naive > /dev/null) 2>> results/naive_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_128_32768.bin:par_for_atomic > /dev/null) 2>> results/atomic_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_128_32768.bin:clustered > /dev/null) 2>> results/clustered_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_128_32768.bin:par_for_clustered > /dev/null) 2>> results/par_for_clustered_ratio.txt

bin/generate_sparse_layer 256 16384 > w/n_256_16384.bin; 
time(cat w/random1M.bin | bin/run_network w/n_256_16384.bin:simple > /dev/null) 2>> results/simple_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_256_16384.bin:par_for_naive > /dev/null) 2>> results/naive_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_256_16384.bin:par_for_atomic > /dev/null) 2>> results/atomic_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_256_16384.bin:clustered > /dev/null) 2>> results/clustered_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_256_16384.bin:par_for_clustered > /dev/null) 2>> results/par_for_clustered_ratio.txt

bin/generate_sparse_layer 512 8192 > w/n_512_8192.bin; 
time(cat w/random1M.bin | bin/run_network w/n_512_8192.bin:simple > /dev/null) 2>> results/simple_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_512_8192.bin:par_for_naive > /dev/null) 2>> results/naive_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_512_8192.bin:par_for_atomic > /dev/null) 2>> results/atomic_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_512_8192.bin:clustered > /dev/null) 2>> results/clustered_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_512_8192.bin:par_for_clustered > /dev/null) 2>> results/par_for_clustered_ratio.txt

bin/generate_sparse_layer 1024 4096 > w/n_1024_4096.bin; 
time(cat w/random1M.bin | bin/run_network w/n_1024_4096.bin:simple > /dev/null) 2>> results/simple_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_1024_4096.bin:par_for_naive > /dev/null) 2>> results/naive_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_1024_4096.bin:par_for_atomic > /dev/null) 2>> results/atomic_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_1024_4096.bin:clustered > /dev/null) 2>> results/clustered_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_1024_4096.bin:par_for_clustered > /dev/null) 2>> results/par_for_clustered_ratio.txt

bin/generate_sparse_layer 2048 2048 > w/n_2048_2048.bin; 
time(cat w/random1M.bin | bin/run_network w/n_2048_2048.bin:simple > /dev/null) 2>> results/simple_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_2048_2048.bin:par_for_naive > /dev/null) 2>> results/naive_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_2048_2048.bin:par_for_atomic > /dev/null) 2>> results/atomic_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_2048_2048.bin:clustered > /dev/null) 2>> results/clustered_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_2048_2048.bin:par_for_clustered > /dev/null) 2>> results/par_for_clustered_ratio.txt

bin/generate_sparse_layer 4096 1024 > w/n_4096_1024.bin; 
time(cat w/random1M.bin | bin/run_network w/n_4096_1024.bin:simple > /dev/null) 2>> results/simple_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_4096_1024.bin:par_for_naive > /dev/null) 2>> results/naive_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_4096_1024.bin:par_for_atomic > /dev/null) 2>> results/atomic_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_4096_1024.bin:clustered > /dev/null) 2>> results/clustered_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_4096_1024.bin:par_for_clustered > /dev/null) 2>> results/par_for_clustered_ratio.txt

bin/generate_sparse_layer 8192 512 > w/n_8192_512.bin; 
time(cat w/random1M.bin | bin/run_network w/n_8192_512.bin:simple > /dev/null) 2>> results/simple_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_8192_512.bin:par_for_naive > /dev/null) 2>> results/naive_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_8192_512.bin:par_for_atomic > /dev/null) 2>> results/atomic_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_8192_512.bin:clustered > /dev/null) 2>> results/clustered_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_8192_512.bin:par_for_clustered > /dev/null) 2>> results/par_for_clustered_ratio.txt

bin/generate_sparse_layer 16384 256 > w/n_16384_256.bin; 
time(cat w/random1M.bin | bin/run_network w/n_16384_256.bin:simple > /dev/null) 2>> results/simple_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_16384_256.bin:par_for_naive > /dev/null) 2>> results/naive_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_16384_256.bin:par_for_atomic > /dev/null) 2>> results/atomic_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_16384_256.bin:clustered > /dev/null) 2>> results/clustered_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_16384_256.bin:par_for_clustered > /dev/null) 2>> results/par_for_clustered_ratio.txt

bin/generate_sparse_layer 32768 128 > w/n_32768_128.bin; 
time(cat w/random1M.bin | bin/run_network w/n_32768_128.bin:simple > /dev/null) 2>> results/simple_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_32768_128.bin:par_for_naive > /dev/null) 2>> results/naive_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_32768_128.bin:par_for_atomic > /dev/null) 2>> results/atomic_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_32768_128.bin:clustered > /dev/null) 2>> results/clustered_ratio.txt
time(cat w/random1M.bin | bin/run_network w/n_32768_128.bin:par_for_clustered > /dev/null) 2>> results/par_for_clustered_ratio.txt

