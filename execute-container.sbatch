#!/bin/bash
#
#SBATCH --time=10:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=16G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jdouglass@stanford.edu
#SBATCH --partition=serc,hns,normal
#SBATCH --job-name="InVEST SDR - Singularity and Conda"
#SBATCH --output=/scratch/users/jadoug06/slurm-logfiles/slurm-%j.%x.out

set -ex

# For comparing CPU speeds, if needed.
hostname
cat /proc/cpuinfo

singularity run --env GDAL_CACHEMAX=129 "docker://ghcr.io/natcap/devstack:2025-07-01" python execute-invest.py "container"
