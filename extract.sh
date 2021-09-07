#!/bin/bash

#@author: Avishek Dutta, avdutta@ucsd.edu

bin=$1

#Extracting header of fasta sequence

grep -e ">" $bin.fa > header.txt

#Removing > from each line

awk 'sub(/^>/, "")' header.txt > header1.txt

#adding file name after each line

cat header1.txt | while read line; do echo ${line},$bin; done >> contig_fate.txt

