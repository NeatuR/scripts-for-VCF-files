#!/bin/bash

#Thie script can be run on all linux machines by typing "bash path/to/printLocus"
#Aim: given a big VCF file, you can skip to a certain variant and print the following N columns

#type the positions of the variants between speechmarks (!no space after the position, each one starts with a new line)
positionList="1602429
1602430
1602431"

while IFS= read -r position; do

#if the vcf is compressed (vcf.gz), use "zgrep"; otherwise use "grep";
#the number at the end of the line denotes the number of columns that will be printed, customise it as desired
zgrep ${position} file_name.vcf.gz | cut -f-8

done <<< "$positionList"
