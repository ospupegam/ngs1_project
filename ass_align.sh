cd ~/workdir/sample_data
wget https://de.cyverse.org/dl/d/A9330898-FC54-42A5-B205-B1B2DC0E91AE/dog_chr5.fa.gz

mkdir -p ~/workdir/ngs_ass/bwa_align/bwaIndex && cd ~/workdir/ngs_ass/bwa_align/bwaIndex
ln -s ~/workdir/sample_data/dog_chr5.fa .
bwa index -a bwtsw dog_chr5.fa

cd ~/workdir/ngs_ass/bwa_align
for x in 1 2 3 4 5;do
R1="$HOME/workdir/ngs_ass/out_unshafeld5/SRR8797509_1.part_001.part_00$x.fastq"
R2="$HOME/workdir/ngs_ass/out_unshafeld5/SRR8797509_2.part_001.part_00$x.fastq"
bwa mem bwaIndex/dog_chr5.fa $R1 $R2 > SRRFastqunshafeld.sam;done



