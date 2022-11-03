#!/bin/bash

ml SAMtools/1.16.1-GCC-11.2.0

bamdir="/fh/scratch/delete90/peters_u/TRPCD/trpcd_data_bam.v1/"
mkdir flagstat

for bam in $(ls ${bamdir}) ; do
	samtools flagstat -@ 4 ${bamdir}$bam | grep "total" | cut -d" " -f 1  > flagstat/${bam%.bam}.txt
done

