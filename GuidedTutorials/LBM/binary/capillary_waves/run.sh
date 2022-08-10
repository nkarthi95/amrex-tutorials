#!/bin/bash

tau_s="0.6 0.7 0.8 0.9 1.0 1.1 1.2"
nsteps=1000

nx=64
max_grid_size=${nx}

for i in ${tau_s}
do

curr_dir=${PWD}
cp_dir="${curr_dir}/nu_test/tau_${i}"
mkdir -p ${cp_dir}

cp main3d.gnu.MPI.ex ${cp_dir}
cp inputs ${cp_dir}

#echo ${cp_dir}

cd ${cp_dir}

sed -i "s/nsteps = 1/nsteps = ${nsteps}/g" inputs
sed -i "s/tau = 0.75/tau = ${i}/g" inputs
sed -i "s/max_grid_size = 16/max_grid_size = ${max_grid_size}/g" inputs
sed -i "s/nx = 64/nx = ${nx}/g" inputs

mpirun -n 4 main3d.gnu.MPI.ex inputs

#nx = 64
#max_grid_size = 16

#nsteps = 1
#plot_int = 1000
#ncorr = 100

#density = 1.0
#temperature = 0.111111e-6
#tau = 0.75

#A = 0.0

cd ${curr_dir}
done
