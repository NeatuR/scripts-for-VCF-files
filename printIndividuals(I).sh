#!/bin/bash

#Thie script can be run on all linux machines by typing "bash path/to/printIndividuals(I)"

#Aim: given a big VCF file, extract the IDs of the individuals that have a certain user-specified genotype (0/1;0/2;0/3 heterozygous and 1/1, 2/2 homozygous) ----PART 1
#In this first part, the columns no. of the individuals are printed


#type the positions of the variants between speechmarks (!no space after the position, each one starts with a new line)
positionList="73901430
73909130
73913586
73914835
73914836
73902459
73908704
73908755
73909074
73916628
73901391"




while IFS= read -r position; do

positionVcf="$position.vcf"


#if the vcf is compressed (vcf.gz), use "zgrep"; otherwise use "grep";
zgrep ${position} filename.vcf.gz > ${positionVcf}

#change "0/2" to the genotype you're interested in (!both lines of code need to have the same genotype value in order for the script to write correctly)
hets=$(zgrep -o '0/2[^[:blank:]]*' ${positionVcf})
variants=$(zgrep -o '0/2[^[:blank:]]*' ${positionVcf} | wc -l)



echo $position " count: "$variants

while IFS= read -r line; do
awk -v line="$line" '{
 		for (i=1;i<=NF;i++) if ($i==line) print "Column: " i }' ${positionVcf}
 done <<< "$hets"



done <<< "$positionList"




