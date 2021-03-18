cd ../
mkdir trimmed_fastq
mkdir job_scripts
mkdir job_logs

for i in `ls data/*_R1_* | xargs -n1 basename`

do

BASENAME=`sed s/_R[12]_.*// <<<$i`;

 {
 echo '#PBS -l walltime=02:00:00'
 echo '#PBS -l nodes=1:ppn=4'
 echo '#PBS -A PAS1532'
 echo '#PBS -j oe'

 echo 'module load trimmomatic'
 echo 'cd $PBS_O_WORKDIR'
 echo 'java -jar $TRIMMOMATIC PE -phred33 -threads 4 -trimlog job_logs/trim_log.txt -basein data/'$i' -baseout trimmed_fastq/'$BASENAME'.fastq.gz ILLUMINACLIP:adaptors/adaptors.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:50'

 } > job_scripts/trimmomatic_$i.job

 qsub job_scripts/trimmomatic_$i.job

done
