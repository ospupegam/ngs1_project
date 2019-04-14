cd ~/workdir/sample_data
wget http://genomedata.org/rnaseq-tutorial/fasta/GRCh38/chr22_with_ERCC92.fa

wget http://genomedata.org/rnaseq-tutorial/annotations/GRCh38/chr22_with_ERCC92.gt

mkdir -p ~/workdir/ngs_ass/hisat_align/hisatIndex && cd ~/workdir/ngs_ass/hisat_align/hisatIndex
ln -s ~/workdir/sample_data/chr22_with_ERCC92.fa .
hisat2_extract_splice_sites.py ~/workdir/sample_data/chr22_with_ERCC92.gtf > splicesites.tsv
hisat2_extract_exons.py ~/workdir/sample_data/chr22_with_ERCC92.gtf > exons.tsv
hisat2-build -p 1 --ss splicesites.tsv --exon exons.tsv chr22_with_ERCC92.fa chr22_with_ERCC92

cd ~/workdir/ngs_ass/hisat_align
for c in 1 2 3 4 5;do
R1="$HOME/workdir/ngs_ass/out_shaffeld5/shuffled_SRR8797509_1.part_001.part_00$c.fastq"
R2="$HOME/workdir/ngs_ass/out_shaffeld5/shuffled_SRR8797509_2.part_001.part_00$c.fastq"

hisat2 -p 1 -x hisatIndex/chr22_with_ERCC92 --dta --rna-strandness RF -1 $R1 -2 $R2 -S UHR_Rep$C.sam;done
