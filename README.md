# Brkljacic_TE_paper_scripts

This repository contains scripts used for analyses and referenced in Brkljacic et al, 
"Frequency, composition and mobility of transposable elements in holdings of plasmid repositories"

Script names include numbers that indicate run sequence.
Analyses were performed on a supercomputer system (Ohio Supercomputer Center) 
implementing PBS, so directives at the top of scripts are specific to PBS systems.

Scripts assume a directory containing data/ and scripts/.
data/ contains the gen10 and gen70 .fastq.gz files that are available from NCBI's SRA
scripts/ contains the scripts described below. Each is run from within this scripts/ dir, either directly (.sh) or as a compute job (.job).

1_trim.sh:
 Runs Trimmomatics to trim adaptor sequences and low quality ends.

2_alignment.job:
 Downloads plasmid 27 (pm-rk), E. coli MDS42 reference genomes, along with the set of 18 IS sequences of interest in the study, and cleans these files as necessary to put them into a single fasta reference file. Then uses this reference to align gen10 and gen70 data with HiSat2.

3_sort.job:
 Sorts alignment output with samtools.

4_picard_MarkDups.sh:
 Marks duplicate reads with Picard

5_gatk.job:
 Prepares files for GATK analysis and performs variant calling with the GATK.

6_filter_alignments.job:
 Filters alignment (sam) files to retain only uniquely mapped reads. Filtered files are then sorted and indexed.

7_get_stats.job:
 For each set of uniquely aligned reads, generates counts of hits to each reference genome or IS element in the reference file.
Results are stored in "gen10_final_summary.txt" and "gen70_final_summary.txt" for gen10 and gen70, respectively.

8_filter_variants.sh:
 Original GATK variant calling included variants for E. coli (MDS42) in addition to pm-rk (plasmid 27). Filters for just the latter.

9_bcftools_mpileup_all.job:
 Code associated with analysis to check sensitivity of results to variant calling approach (the GATK vs bcftools workflow).



