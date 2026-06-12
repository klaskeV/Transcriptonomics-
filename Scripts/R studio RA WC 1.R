# working directory
setwd("C:/Users/klask/OneDrive - NHL Stenden/R mapje/Transcriptonomics/RA project/")
getwd()

# package downloaden
install.packages('BiocManager')

#package downloaden
BiocManager::install('Rsubread')

#inladen Rsubread
library(Rsubread)

#handleiding
browseVignettes('Rsubread')

buildindex(basename = 'ref_human', reference = '../RA project/ncbi_dataset (1)/ncbi_dataset/data/GCF_000001405.40/GCF_000001405.40_GRCh38.p14_genomic.fna', memory = 16000, indexSplit = TRUE)


align.norm1 <- align(index = "ref_human", readfile1 = "SRR4785819_1_subset40k.fastq", readfile2 = "SRR4785819_2_subset40k.fastq", output_file = "norm1.BAM")
align.norm2 <- align(index = "ref_human", readfile1 = "SRR4785820_1_subset40k.fastq", readfile2 = "SRR4785820_2_subset40k.fastq", output_file = "norm2.BAM")
align.norm3 <- align(index = "ref_human", readfile1 = "SRR4785828_1_subset40k.fastq", readfile2 = "SRR4785828_2_subset40k.fastq", output_file = "norm3.BAM")
align.norm4 <- align(index = "ref_human", readfile1 = "SRR4785831_1_subset40k.fastq", readfile2 = "SRR4785831_2_subset40k.fastq", output_file = "norm4.BAM")
align.RA1 <- align(index = "ref_human", readfile1 = "SRR4785979_1_subset40k.fastq", readfile2 = "SRR4785979_2_subset40k.fastq", output_file = "RA1.BAM")
align.RA2 <- align(index = "ref_human", readfile1 = "SRR4785980_1_subset40k.fastq", readfile2 = "SRR4785980_2_subset40k.fastq", output_file = "RA2.BAM")
align.RA3 <- align(index = "ref_human", readfile1 = "SRR4785986_1_subset40k.fastq", readfile2 = "SRR4785986_2_subset40k.fastq", output_file = "RA3.BAM")
align.RA4 <- align(index = "ref_human", readfile1 = "SRR4785988_1_subset40k.fastq", readfile2 = "SRR4785988_2_subset40k.fastq", output_file = "RA4.BAM")

# Rsamtools laden voor sorteren en indexen
BiocManager::install('Rsamtools')
library(Rsamtools)

# bestandsnamen van de monsters 
samples <- c('norm1', 'norm2', 'norm3', 'norm4', 'RA1', 'RA2', 'RA3', 'RA4')

# sorteer BAM bestanden
lapply(samples, function(s) {sortBam(file = paste0(s, '.BAM'), destination = paste0(s, '.sorted'))
})

# indexeer de gesorteerde BAM-file
lapply(samples, function(s) {indexBam(file = paste0(s, '.sorted.bam'))
})

