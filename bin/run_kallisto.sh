#!/bin/bash
#run_kallisto

module load kallisto/0.44.0

mkdir -p /gpfs/scratch/jz4391/asi-final/kallisto/

kallisto index -i /gpfs/scratch/jz4391/asi-final/HomoSapiens \
        /gpfs/scratch/jz4391/asi-final/Homo_sapiens.GRCh38.cdna.all.fa

TREATMENTS='dmso ciclopirox cocl2 wortmannin'

for A_TREATMENT in $TREATMENTS; do
    mkdir -p /gpfs/scratch/jz4391/asi-final/kallisto/$A_TREATMENT
    SAMPLES=`ls /gpfs/scratch/jz4391/asi-final/samples/$A_TREATMENT/ | sed -e 's/\.fastq.gz$//'`

    for A_SAMPLE in $SAMPLES; do
        kallisto quant -i /gpfs/scratch/jz4391/asi-final/HomoSapiens \
        -o /gpfs/scratch/jz4391/asi-final/kallisto/$A_TREATMENT/$A_SAMPLE/ \
        -b 100 \
        --single -l 200 -s 20 \
        --bias \
        /gpfs/scratch/jz4391/asi-final/samples/$A_TREATMENT/${A_SAMPLE}.fastq.gz
    done
done