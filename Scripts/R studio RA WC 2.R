# inladen
library(Rsubread)

# working directory
setwd("C:/Users/klask/OneDrive - NHL Stenden/R mapje/Transcriptonomics/RA project/BAM_RA_files/")

# nieuwe naam geven aan BAM files
allsamplesRA <- c("Norm1.BAM", "Norm2.BAM", "Norm3.BAM", "Norm4.BAM", "RA1.BAM", "RA2.BAM", "RA3.BAM", "RA4.BAM")

# count matrix maken met humaan genoom
count_matrixRA <- featureCounts(files = allsamplesRA , annot.ext = "../ncbi_dataset gtf/ncbi_dataset/data/GCF_000001405.40/genomic.gtf", isPairedEnd = TRUE, isGTFAnnotationFile = TRUE, GTF.attrType = "gene_id", useMetaFeatures = TRUE)

#data bekijken
str(count_matrixRA)

# countsRA opslaan onder nieuwe naam 
countsRA <- count_matrixRA$counts
head(countsRA)

# kolomnamen instellen
colnames(countsRA) <- c("Norm1", "Norm2", "Norm3", "Norm4", "RA1", "RA2", "RA3", "RA4")

head(countsRA)

# matrix oplsaan
write.csv(countsRA, "RA_countmatrix.csv")
