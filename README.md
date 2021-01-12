# Brkljacic_TE_paper_scripts

This repository contains scripts used for analyses in Brkljacic et al, 
"Frequency, composition and mobility of transposable elements in holdings of plasmid repositories"

Script names include numbers that indicate run sequence.
Analyses were performed on a supercomputer system (Ohio Supercomputer Center) 
implementing PBS, so directives at the top of scripts are specific to PBS systems.

Scripts assume a directory containing data/ and scripts/.
data/ contains the gen10 and gen70 .fastq.gz files
scripts/ contains the scripts described below. Each is run from within this scripts/ dir, either directly or as a compute job.

1_trim.sh
Runs Trimmomatics to trim adaptor sequences and low quality ends.

2_pmrk_alignment.job
Downloads pm-rk reference genome and cleans. Then uses this reference to align gen10 and gen70 data with HiSat2.

3_sort.job
Sorts alignment output with samtools.

4_picard_MarkDups.sh
Marks duplicate reads with Picard

5_gatk_diploid.job
Prepares files for GATK analysis and performs variant calling with the GATK assuming diploid samples.

6_gatk_haploid.job
Similar to script 5 above, but performs variant calling assuming haploid samples. Results from this script were not included in the paper.

7_get_coverage.job
Script to calculate read depths/coverages.

8_align_ecoli.job
Takes reads that didn't map to pm-rk and aligns them to E.coli.

9_align_IS.job
Takes reads that didn't map to either pm-rk or E. coli and maps them to a set of possible IS sequences.




