cd ..
mkdir picard_out
mkdir picard_out/metrics

for i in $(ls alignments/*sorted* | xargs -n1 basename)

do

 {
 echo '#PBS -l walltime=08:00:00'
 echo '#PBS -l nodes=1:ppn=1'
 echo '#PBS -A PAS1532'
 echo '#PBS -j oe'

 echo 'cd $PBS_O_WORKDIR'
 echo 'module load picard'
 echo 'java -jar $PICARD MarkDuplicates I=alignments/'$i' O=picard_out/'$i' M=picard_out/metrics/'$i
 } > job_scripts/picard_$i.sh

qsub job_scripts/picard_$i.sh

done


