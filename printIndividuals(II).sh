#!/bin/bash

##Thie script can be run on all linux machines by typing "bash path/to/printIndividuals(I)"

#Aim: given a big VCF file, extract the IDs of the individuals that have a certain user-specified genotype (0/1;0/2;0/3 heterozygous and 1/1, 2/2 homozygous) ----PART 1
#In this second part, the IDs of the individuals will be printed based on the column they're on
#before running this script create a "header.vcf" file by running "zgrep/grep 'CHROM' filename.vcf/filename.vcf.gz > header.vcf"
#Warning: You'll lose the origin of the variants


#type the column numbers between speechmarks (!no space after the position, each one starts with a new line)


columnList="900
34
57"


while IFS= read -r column; do


cat headers.vcf | awk -v column="$column" '{print $column}' 


done <<< "$columnList"