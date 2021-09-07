#!/usr/bin/env python3

"""
@author: Avishek Dutta, avdutta@ucsd.edu
@requires: python3, pandas
"""

import pandas as pd
import os

#searching and reading the output annotation file from emapper

path = '.'
files_in_dir = [f for f in os.listdir(path) if f.endswith('final.annotations')]
for filenames in files_in_dir:
    df = pd.read_csv(filenames, sep='\t')

#breaking the query name to extract the information of the contigs

df[['A','B','C','D','E','F','G']] = df['#query'].str.split('_',expand=True)

#rebuilding the contig name from the fragments done in the previous step

df['contig_name']=df['A']+'_'+df['B']+'_'+df['C']+'_'+df['D']+'_'+df['E']+'_'+df['F']

#finding the fate of contigs from the file generated in the shell script

bin_fate = pd.read_csv ("contig_fate.txt", names=('contig_name', 'bin_name'))

#merging the two files for functional allocations to bins

merged_df = df.merge(bin_fate, how='left', on='contig_name')

#removing the unessory columns used before

merged_df = merged_df.drop(columns=['A','B','C','D','E','F','G'])

#rearranging the column to bring the bin_name at the first column

merged_df = merged_df[ ['bin_name'] + [ col for col in merged_df.columns if col != 'bin_name' ] ]

#saving the master file for functional binning

merged_df.to_csv('functional_bin.csv', index=False)

#extracting unique name from the bin_name column for functional binning and generating separate file for each bin

array = merged_df['bin_name'].unique().tolist()

#for loop for generating separate files for each bins

for x in array:
  df_new = merged_df[merged_df['bin_name'] == x]
  df_new.to_csv('{}.annotation_fb.csv'.format(x), index=False)
