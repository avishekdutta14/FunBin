#!/bin/bash

#@author: Avishek Dutta, avdutta@ucsd.edu

#defining sample name

sample=$1
output=$2

#removing existing files from the folder

rm -rf functional_bin.csv
rm -rf *.annotation_fb.csv
rm -rf $sample.mod1.annotations
rm -rf $sample.final.annotations
rm -rf contig_fate.txt

#reading bin name and saving

for f in *.fa; do printf '%s\n' "${f%.fa}" >> bin_name.txt; done

while read f; do ./extract.sh $f; done < bin_name.txt

rm -r header.txt
rm -r header1.txt


#preparing emapper output file for functional binning

tail -n +5 $sample.emapper.annotations > $sample.mod1.annotations

head -n -3 $sample.mod1.annotations > $sample.final.annotations

#functional binning

./funct_bin.py

#saving the output to the user defined folder
mkdir $output

rm -rf nan.annotation_fb.csv
mv functional_bin.csv $sample.functional_bin.csv
mv $sample.functional_bin.csv $output
mv *.annotation_fb.csv $output
mv contig_fate.txt $output

#removing temporary files to avoid redundancy and overlaps

rm -rf nan.annotation_fb.csv
rm -rf bin_name.txt
rm -rf $sample.mod1.annotations
rm -rf $sample.final.annotations
rm -rf contig_fate.txt

