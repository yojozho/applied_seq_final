#!/bin/bash
#run_trimgalore

module load trimgalore/0.5.0
module load python/cpu/2.7.15-ES

mkdir -p trimmed

TREATMENTS='dmso ciclopirox cocl2 wortmannin'

for A_TREATMENT in $TREATMENTS; do
    SAMPLES=`ls /gpfs/scratch/jz4391/asi-final/samples/$A_TREATMENT/`

    for A_SAMPLE in $SAMPLES; do
        trim_galore --length 30 -o \
            /gpfs/scratch/jz4391/asi-final/trimmed/$A_TREATMENT/ \
            /gpfs/scratch/jz4391/asi-final/samples/$A_TREATMENT/$A_SAMPLE
    done 
done