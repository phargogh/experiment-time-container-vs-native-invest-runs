#!/usr/bin/env sh

for file in *.sbatch
do
    sbatch "$file"
done
