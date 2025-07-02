#!/bin/bash
#
#SBATCH --time=10:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=8G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jdouglass@stanford.edu
#SBATCH --partition=serc,hns,normal
#SBATCH --job-name="InVEST SDR - Bare Metal Install"
#SBATCH --output=/scratch/users/jadoug06/slurm-logfiles/slurm-%j.%x.out

set -ex

source invest-env/bin/activate

which python

python execute-invest.py


