#workin directory instellen
setwd("C:/Users/klask/OneDrive - NHL Stenden/R mapje/Transcriptonomics/RA project")

# count matrix inladen (niet inladen eigen data)
countsRA <-read.csv("RA_countmatrix.csv", row.names= 1)
countsRA


# count matrix gekregen van Dewi
countsRA2 <-read.table("count_matrix_RA.txt", row.names= 1)
countsRA2 

# installeren van packeges
BiocManager::install("DESeq2")
BiocManager::install("KEGGREST")
BiocManager::install("EnhancedVolcano")
BiocManager::install("pathview")

# inladen
library(DESeq2)
library(KEGGREST)
library(EnhancedVolcano)
library(pathview)

# tabel maken
treatmentRA <- c("Normaal", "Normaal", "Normaal", "Normaal", "RA", "RA", "RA", "RA")
treatment_table <- data.frame(treatmentRA)

# Rijnamen veranderen
rownames(treatment_table) <- c('Norm1', 'Norm2', 'Norm3','Norm4', 'RA1', 'RA2', 'RA3', 'RA4')
head(rownames(treatment_table))

#colnames veranderen
colnames(countsRA2) <- c("Norm1", "Norm2", "Norm3", "Norm4", "RA1", "RA2", "RA3", "RA4")

# Maak DESeqDataSet aan
dds <- DESeqDataSetFromMatrix(countData = countsRA2, colData = treatment_table, design = ~ treatmentRA)

# Voer analyse uit
dds <- DESeq(dds)
resultaten <- results(dds)

# opslaan resultaten test 
write.table(resultaten, file = 'Resultaten_RA_WC3.csv', row.names = TRUE, col.names = TRUE)



# significante genen op en neer gereguleerd
sum(resultaten$padj < 0.05 & resultaten$log2FoldChange > 1, na.rm = TRUE)
sum(resultaten$padj < 0.05 & resultaten$log2FoldChange < -1, na.rm = TRUE)

# opvallenste genen
hoogste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = TRUE), ]
laagste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = FALSE), ]
laagste_p_waarde <- resultaten[order(resultaten$padj, decreasing = FALSE), ]
# hoogste_fold_change: zet de genen met de sterkste opregulatie bovenaan.
# laagste_fold_change: zet de genen met de sterkste neerregulatie bovenaan.
# laagste_p_waarde: zet de genen met de meest significante p-waarden bovenaan.

hoogste_fold_change
laagste_fold_change
laagste_p_waarde

# volcano plot maken
EnhancedVolcano(resultaten, lab = rownames(resultaten), x = 'log2FoldChange', y = 'padj')

# Vulcano plot opslaan
dev.copy(png, 'VolcanoplotWC.png',  width = 8, height = 10, units = 'in',res = 500) 
dev.off()


resultaten <- read.table("Resultaten_RA_WC3.csv")

all <- rownames(resultaten)

library(dplyr)
# voorbeeld van dewi
... <- input %>%
  filter(gecorrigeerde < 0.05, logfc > 1)

# selecteren van genen die upregulated zijn. 
up_genes <- resultaten[
  which(resultaten$padj < 0.05 &
          resultaten$log2FoldChange > 1), ]

genes_up <- rownames(up_genes)

# selecteren van downregulated genen.
down_genes <- resultaten[which(resultaten$padj < 0.05 &resultaten$log2FoldChange < -1), ]

genes_down <- rownames(down_genes)

# aantal genen controleren
length(genes_up)
length(genes_down)

#packages installeren
if (!requireNamespace("BiocManager"))
  install.packages("BiocManager")

BiocManager::install("clusterProfiler")
BiocManager::install("org.Hs.eg.db")
BiocManager::install("enrichplot")
BiocManager::install("goseq")

#libraries laden
library(clusterProfiler)
library(org.Hs.eg.db)
library(enrichplot)
library(goseq)

 # referentie genen bekijken
supportedOrganisms() 

# vector maken voor genes up
gene.vector_up=as.integer(all%in% genes_up)
names(gene.vector_up)=all
# vector bekijken

head(gene.vector_up)
tail(gene.vector_up)

# vector maken voor genes down 
gene.vector_down=as.integer(all%in% genes_down)
names(gene.vector_down)=all

# vector bekijken
head(gene.vector_down)
tail(gene.vector_down)

# upregulated vector onderscheiden bij lengte 
pwf_up =nullp(gene.vector_up,"hg19","geneSymbol")

# downregulated vector onderscheiden bij lengte 
pwf_down =nullp(gene.vector_down,"hg19","geneSymbol")

# enriched GO terms upregulated
GO.wall_up=goseq(pwf_up,"hg19","geneSymbol")

#How many enriched GO terms do we have
class(GO.wall_up)
head(GO.wall_up)
nrow(GO.wall_up)

# downregulated
GO.wall_down=goseq(pwf_down,"hg19","geneSymbol")

#How many enriched GO terms do we have
class(GO.wall_down)
head(GO.wall_down)
nrow(GO.wall_down)

# enriched go voor upregulated genes
enriched.GO_up=GO.wall_up$category[GO.wall_up$over_represented_pvalue<.05]
#NOTE: They recommend using a more stringent multiple testing corrected p value here

#How many GO terms do we have now?
class(enriched.GO_up)
head(enriched.GO_up)
length(enriched.GO_up)

# enriched go voor downregulated genes
enriched.GO_down=GO.wall_down$category[GO.wall_down$over_represented_pvalue<.05]
#NOTE: They recommend using a more stringent multiple testing corrected p value here

#How many GO terms do we have now?
class(enriched.GO_down)
head(enriched.GO_down)
length(enriched.GO_down)

# resultaten bekijken
head(GO.wall_up[order(GO.wall_up$over_represented_pvalue), ], 20)

# inladen packages
library(ggplot2)
library(dplyr)

# filteren op significante go termen
GO.sig_up <- GO.wall_up %>% filter(over_represented_pvalue < 0.05)

GO.sig_down <- GO.wall_down %>% filter(over_represented_pvalue < 0.05)

# package installeren
install.packages("stringr")

# package inladen
library(stringr)

# visualiseren met dotplot
# visualiseren met kortere GO-term
GO.sig_up %>% top_n(10, wt = -over_represented_pvalue) %>% mutate(hitsPerc = numDEInCat * 100 / numInCat
  ) %>% ggplot(aes(x = hitsPerc, y = str_wrap(term, width = 30), colour = over_represented_pvalue, size = numDEInCat)) +
  geom_point() + expand_limits(x = 0) + labs(x = "Hits (%)", y = "GO term", colour = "p value", size = "Count")


# pathway analyse 
library(KEGGREST)

keggList("pathway", "hsa")

# data voorbereiden
gene.data <- resultaten$log2FoldChange
names(gene.data) <- rownames(resultaten)

# installeren packages 
BiocManager::install("pathview")
library(pathview)

# converteren entrez ID packeges inladen
library(org.Hs.eg.db)
library(AnnotationDbi)

# converteren 
entrez_ids <- mapIds(org.Hs.eg.db, keys = rownames(resultaten), column = "ENTREZID", keytype = "SYMBOL", multiVals = "first")

# voeg toe aan data set 
resultaten$entrez <- entrez_ids

# verwijder NA's
resultaten <- resultaten[!is.na(resultaten$entrez), ]

# correcte vector maken
gene.data <- resultaten$log2FoldChange
names(gene.data) <- resultaten$entrez

# pathway visualiseren
pathview(gene.data = gene.data, pathway.id = "hsa05323", species = "hsa", gene.idtype = "entrez", limit = list(gene = 5))

# bekijken pathview 
browseURL("hsa05323.pathview.png")

pathview(gene.data = gene.data, pathway.id = "hsa04060", species = "hsa", gene.idtype = "entrez", limit = list(gene = 5))


# bekijken resultaten 
browseURL("hsa04060.pathview.png")

pathview(gene.data = gene.data, pathway.id = "hsa04620", species = "hsa", gene.idtype = "entrez", limit = list(gene = 5))

# bekijken resultaten 
browseURL("hsa04620.pathview.png")
