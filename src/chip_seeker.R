setwd("/Users/isaf27/Documents/3rd_course/bio/project/hse21_H3K9me3_ZDNA_human/src")
source('lib.R')

###

library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(clusterProfiler)

###

#NAME <- 'H3K4me3_A549.intersect_with_DeepZ'
#NAME <- 'DeepZ'
NAME <- 'H3K9me3_A549.ENCFF811QUJ.hg19.filtered'
#NAME <- 'H3K9me3_A549.ENCFF444EWQ.hg19.filtered'
BED_FN <- paste0(DATA_DIR, NAME, '.bed')

###

txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.pdf'))
#png(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.png'))
plotAnnoPie(peakAnno)
dev.off()

peak <- readPeakFile(BED_FN)
pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.covplot.pdf'))
covplot(peak, weightCol="V5")
dev.off()