#!/bin/bash
#
#SBATCH --time=10:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=8G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jdouglass@stanford.edu
#SBATCH --partition=serc,hns,normal
#SBATCH --job-name="InVEST SDR - Bare Metal Install"
#SBATCH --output=/scratch/users/jadoug06/slurm-logfiles/slurm-%j.%x.out

set -ex

module load python/3.9.0
module load physics gdal/3.10.2
source invest-env/bin/activate

which python

GDAL_CACHEMAX=2048 python execute-invest.py "baremetal"


