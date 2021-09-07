# FunBin - Functional Binning (under development)

FunBin is a tool for separating and allocating functions to the bins or Metagenome-assembled genomes (MAGs) based on annotation of assembled contigs. This tool presently works with the output of [metaspades](https://github.com/ablab/spades), [metabat2](https://bitbucket.org/berkeleylab/metabat/src/master/), and [emapper](https://github.com/eggnogdb/eggnog-mapper). FunBin is compatible with the [iMAGine](https://github.com/avishekdutta14/iMAGine) tool.

The advantages of this tool are that the user does not need to re-annotate all the bins/MAGs separately, once they annotate the assembled contigs from the metaspades output. FunBin is tested with the emapper output where prodigal was used for predicting genes (amino acid sequences), and they were annotated using diamond.

## Downloading FunBin
```
git clone https://github.com/avishekdutta14/FunBin.git
chmod a+x *.sh
chmod a+x *.py
```
## Dependencies for FunBin

FunBin requires python3 and pandas (python package).

## For running FunBin

Create a directory, and copy all the output bins (.fa files) from metabat2 to that folder. Also, place the annotation file ending with .annotations (output of emapper.py) in the same folder and then place the three scripts (present in the FunBin repository) that you have downloaded in the same folder. The scripts can also be declared in the PATH. Run the following as mentioned below

```
./funbin.sh sample_name(in the annotation file) output_folder_name
```

The sample_name is the same as the -o argument passed when running emapper.py. For e.g., if the output of emapper.py is sampleA.emapper.annotations and the output folder defined by the user is FunBin_output, then the command will be

```
./funbin.sh sampleA FunBin_output
```

## Outputs of FunBin

A Folder with the user-input folder name will be generated with the following outputs

1. contig_fate.txt - a file containing the fate of contigs in the respective bins
2. sample_name.functional_bin.csv - this file will be the modifications of the emapper.annotations file with an added column mentioning the fate of each amino acid sequence in different bins. This file can give the user an overview of the functions segregation across different bins.
3. bin_name.annotation_fb.csv - An annotation file for each bin will be generated. For e.g., if there are 50 bins, there will be 50 annotation files that will be generated for each bin.

## How it works?

FunBin tracks and maps the fate of each contig (contig_fate.txt) among different bins. Then it extracts the information of ORFs from each contig and also the annotations of those ORFs and maps them (output in sample_name.functional_bin.csv). Once both the fate of the contigs and annotated ORFs from those contigs are retrieved, then the functions are segregated among different bins (bin_name.annotation_fb.csv) based on mapping (sample_name.functional_bin.csv).


## The advantages of FunBin are as follows

1. Reduces computational time
2. Maintains ubiquitous annotations throughout the pipeline
3. Reduces redundancy in annotation
4. Gives a better perspective of the fate of genes among bins in metagenomes
5. Better start for comparative genomics and metagenomics

## Limitations

1. The present version can only be used for a particular workflow. But, the codes can be modified and used with the outputs from other tools.
2. For certain annotation pipelines, annotating MAGs separately might result in a slightly better result. This is because certain annotation pipelines depend on taxonomy of a genome, which sometimes yield better results.




