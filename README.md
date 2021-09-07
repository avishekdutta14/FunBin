# FunBin - Functional Binning

FunBin is a tool for separating and allocating functions to the bins or Metagenome-assembled genomes (MAGs) based on annotation of assembled contigs. This tool presently works with the output of [metaspades](https://github.com/ablab/spades), [metabat2](https://bitbucket.org/berkeleylab/metabat/src/master/), and [emapper](https://github.com/eggnogdb/eggnog-mapper). FunBin is compatible with the [iMAGine](https://github.com/avishekdutta14/iMAGine) tool.

The advantages of this tool is that the user does not need to re-annotate all the bins/MAGs separately, once they annotate the the assembled contigs from the metaspades output. FunBin is tested with the emapper output where prodigal was used for predicting genes (amino acid sequences) and they were annotated using diamond.

## Downloading FunBin
```
git clone https://github.com/avishekdutta14/iMAGine.git
chmod a+x *.sh
chmod a+x *.py
```

## For running FunBin

## The advantages of FunBin are as follows

1. Reduces computational time
2. Maintains ubiquitous annotations throughout the pipeline
3. Reduces redundancy in annotation
4. Gives a better perspective of fate of genes among bins in metagenomes
5. Better start for comparative genomics and metagenomics

## Limitations

1. The present version can only be used for a particular workflow. But, the codes can be modified and used with the outputs from other tools.
2. For certain annotation pipelines, annotating MAGs separately might result in a slightly better result.




