#!/bin/bash

L="2 4 8 16 32"
T="0.500"
k="0.01"
lambdas="1.1"

for i in ${k};
do
top_dir=${PWD}
for j in ${T}; 
do
for l in ${L}
do
for lambda in ${lambdas}
do
    curr_dir=./k_${i}/lambda_${lambda}/T_${j}/l_${l}
    mkdir -p ${curr_dir}
    cp main3d.gnu.MPI.ex ./${curr_dir}
    #cp main3d.gnu.MPI.CUDA.ex ./${curr_dir}
    cd ./${curr_dir}
    mpirun -n 6 ./main3d.gnu.MPI.ex nx=128 nsteps=100 plot_int=1 lambda=${lambda} n_waves=${l} T=${j} kappa=${i} temperature=0 init_cond=1
    # ./main3d.gnu.MPI.CUDA.ex nx=64 nsteps=100 plot_int=20 lambda=1.1 l=${l} T=${j} kappa=${i} temperature=0 init_cond=1
    echo ${PWD}
    cd ${top_dir}
done
done
done
done
