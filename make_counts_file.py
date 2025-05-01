import os
import pandas as pd
import numpy as np

treatments = ["dmso", "ciclopirox", "cocl2", "wortmannin"]

work_dir = "/Users/yojozho/Desktop/spring2025/applied_info/asi-final/kallisto/"

all_counts_df = pd.DataFrame()

for treatment in treatments: 
    treatment_counts_df = pd.DataFrame()
    treatment_dir = work_dir + treatment
    sample_dirs = os.listdir(treatment_dir)
    for sample in sample_dirs: 
        temp_df = pd.read_csv(treatment_dir + "/" + sample + "/output.txt", sep='\t')
        temp_df = temp_df.rename(columns={temp_df.columns[0]: sample})
        temp_df.insert(0, 'gene_id', temp_df.index)
        if treatment_counts_df.empty:
            treatment_counts_df = temp_df 
        else:
            treatment_counts_df = pd.merge(treatment_counts_df, temp_df, on='gene_id')
    treatment_counts_df.to_csv(treatment_dir + "/output.txt", sep='\t', index=False)
    if all_counts_df.empty:
        all_counts_df = treatment_counts_df
    else:
        all_counts_df = pd.merge(all_counts_df, treatment_counts_df, on='gene_id')
all_counts_df.to_csv(work_dir + "/output.txt", sep='\t', index=False)
        