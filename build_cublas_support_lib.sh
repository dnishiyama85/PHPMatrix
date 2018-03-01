nvcc -O3 --ptxas-options=-v --compiler-options '-fPIC' --shared  cublas_sgemm.cu -o modules/libcublas_sgemm.so -lcublas

