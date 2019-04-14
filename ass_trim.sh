# mild trimming for unshaffeld seq`
for x in 1 2 3 4 5;do
f1="$HOME/workdir/ngs_ass/out_unshafeld5/SRR8797509_1.part_001.part_00$x.fastq"
f2="$HOME/workdir/ngs_ass/out_unshafeld5/SRR8797509_2.part_001.part_00$x.fastq"
newf1="$HOME/workdir/ngs_ass/unshuffled_trim/SRR8797509_1.part_001.part_00$x.fastq"
newf2="$HOME/workdir/ngs_ass/unshuffled_trim/SRR8797509_2.part_001.part_00$x.fastq"
newf1U="$HOME/workdir/ngs_ass/unshuffled_trim/SRR8797509_1.part_001.part_00$x.fastq"
newf2U="$HOME/workdir/ngs_ass/unshuffled_trim/SRR8797509_2.part_001.part_00$x.fastq"

trimmomatic PE -threads 1 -phred33 -trimlog trimLogFile -summary statsSummaryFile  $f1 $f2 $newf1 $newf1U $newf2 $newf2U \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:1 SLIDINGWINDOW:5:5 MINLEN:36;done

# aggresive trimming 
for c in 1 2 3 4 5;do
f3="$HOME/workdir/ngs_ass/out_shaffeld5/shuffled_SRR8797509_1.part_001.part_00$c.fastq"
f4="$HOME/workdir/ngs_ass/out_shaffeld5/shuffled_SRR8797509_2.part_001.part_00$c.fastq"
newf3="$HOME/workdir/ngs_ass/shuffled_trim/shuffled_SRR8797509_1.part_001.part_00$c.fastq"
newf4="$HOME/workdir/ngs_ass/shuffled_trim/shuffled_SRR8797509_2.part_001.part_00$c.fastq"
newf3U="$HOME/workdir/ngs_ass/shuffled_trim/shuffled_SRR8797509_1.part_001.part_00$c.fastq"
newf4U="$HOME/workdir/ngs_ass/shuffled_trim/shuffled_SRR8797509_2.part_001.part_00$c.fastq"

trimmomatic PE -threads 1 -phred33 -trimlog trimLogFile2 -summary statsSummaryFile2  $f3 $f4 $newf3 $newf3U $newf4 $newf4U \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:1 SLIDINGWINDOW:5:33 MINLEN:36;done
