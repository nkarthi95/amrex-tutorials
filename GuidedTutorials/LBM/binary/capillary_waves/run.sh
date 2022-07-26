#!/bin/bash

L="1"
T="0.500"
k="0.005 0.01 0.02"
lambdas="1.1"
taus="0.8 1.0 1.2"
nx=128

for i in ${k};
do
top_dir=${PWD}
for j in ${T}; 
do
for l in ${L}
do
for lambda in ${lambdas}
do
for tau in ${taus}
do
#sed 's/^.*at/REPLACED/'
#sed 's/^.*at/REPLACED/'
sed -n -i 's/nsteps=1/nsteps=10000/p' inputs
#    curr_dir=./damping/tau_${tau}/k_${i}/lambda_${lambda}/T_${j}/l_${l}
#    mkdir -p ${curr_dir}
    #cp main3d.gnu.MPI.ex ./${curr_dir}
#    cp main3d.gnu.MPI.CUDA.ex ./${curr_dir}
#    cd ./${curr_dir}
    #mpirun -n 6./main3d.gnu.MPI.ex nx=128 nsteps=20000 plot_int=500 lambda=${lambda} n_waves=${l} T=${j} kappa=${i} temperature=0 init_cond=1
#    ./main3d.gnu.MPI.CUDA.ex nx=${nx} max_grid_size=${nx} nsteps=20000 plot_int=500 lambda=${lambda} n_waves=${l} T=${j} kappa=${i} temperature=0 init_cond=1
#    echo ${PWD}
#    cd ${top_dir}
done
done
done
done
done
