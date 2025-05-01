#!/bin/bash
#run_fastqc.sh

#load tools
module load fastqc/0.11.7

mkdir -p /gpfs/scratch/jz4391/asi-final/fastqc

TREATMENTS='dmso ciclopirox cocl2 wortmannin'

for A_TREATMENT in $TREATMENTS; do
    mkdir -p /gpfs/scratch/jz4391/asi-final/fastqc/$A_TREATMENT
    SAMPLES=`ls /gpfs/scratch/jz4391/asi-final/samples/$A_TREATMENT/`

    for A_SAMPLE in $SAMPLES; do
        fastqc -o /gpfs/scratch/jz4391/asi-final/fastqc/$A_TREATMENT/ \
        /gpfs/scratch/jz4391/asi-final/samples/$A_TREATMENT/$A_SAMPLE
    done
done