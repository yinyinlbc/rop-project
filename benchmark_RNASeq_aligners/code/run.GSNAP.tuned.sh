#!/bin/bash

AUTHOR="Serghei Mangul"



################################################################
##########          The main template script          ##########
################################################################

toolName="gsnap"
toolPath="/u/home/h/harryyan/project-eeskin/utilities/gmap-2017-09-30/src/gsnap"
index1="/u/home/h/harryyan/project-eeskin/utilities/gmap-2017-09-30/db/GRCh38/"
index2="GRCh38"




if [ $# -lt 3 ]
then
echo "********************************************************************"
echo "Script was written for project : Comprehensive analysis of RNA-sequencing to find the source of 1 trillion reads across diverse adult human tissues"
echo "This script was written by Serghei Mangul"
echo "********************************************************************"
echo ""
echo "1 <input1>   - R1.fastq"
echo "2 <input2>   - R2.fastq"
echo "3 <outdir>  - dir to save the output"
echo "--------------------------------------"
exit 1
fi



# mandatory part
input1=$1
input2=$2
outdir=$3



# STEP 0 - create output directory if it does not exist

mkdir $outdir
pwd=$PWD
cd $outdir
outdir=$PWD
cd $pwd
logfile=$outdir/report_$(basename ${input1%.*})_${toolName}.log


echo $logfile


# -----------------------------------------------------

echo "START" >> $logfile
# STEP 1 - prepare input if necessary (ATTENTION: TOOL SPECIFIC PART!)
# -----------------------------------


# STEP 2 - run the tool (ATTENTION: TOOL SPECIFIC PART!)

now="$(date)"
printf "%s --- RUNNING %s\n" "$now" $toolName >> $logfile

# run the command
res1=$(date +%s.%N)

echo "$toolPath 





$toolPath --format=sam -D $index1 -d $index2 --max-mismatches 15 --indel-penalty 1 --gmap-min-match-length 10 --pairexpect 221 --pairdev 41 --merge-distant-samechr --ordered --novelsplicing 1 --use-splicing <index name>.splicesites --nthreads 16 --batch 5 --expand-offsets 1 $input1 $input2 | samtools view -bS ->$outdir/${toolName}_$(basename ${input1%.*}).bam  2>>$logfile
samtools view -f 0x4 -bh $outdir/${toolName}_$(basename ${input1%.*}).bam | samtools bam2fq - >$outdir/${toolName}_$(basename ${input1%.*})_unmapped.fastq  2>>$logfile





res2=$(date +%s.%N)
dt=$(echo "$res2 - $res1" | bc)
dd=$(echo "$dt/86400" | bc)
dt2=$(echo "$dt-86400*$dd" | bc)
dh=$(echo "$dt2/3600" | bc)
dt3=$(echo "$dt2-3600*$dh" | bc)
dm=$(echo "$dt3/60" | bc)
ds=$(echo "$dt3-60*$dm" | bc)
now="$(date)"
printf "%s --- TOTAL RUNTIME: %d:%02d:%02d:%02.4f\n" "$now" $dd $dh $dm $ds >> $logfile

now="$(date)"
printf "%s --- FINISHED RUNNING %s %s\n" "$now" $toolName >> $logfile

# ---------------------




# STEP 3 - transform output if necessary (ATTENTION: TOOL SPECIFIC PART!)



now="$(date)"
printf "%s --- TRANSFORMING OUTPUT\n" "$now" >> $logfile


#cat $outdir/one_output_file.fastq | gzip > $outdir/${toolName}_$(basename ${input%.*})_${kmer}.corrected.fastq.gz

now="$(date)"
printf "%s --- TRANSFORMING OUTPUT DONE\n" "$now" >> $logfile

# remove intermediate files
#rm $outdir/one_output_file.fastq


# --------------------------------------



printf "DONE" >> $logfile
