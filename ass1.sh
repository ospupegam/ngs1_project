seqkit split2 -1 ./SRR8797509_X.part_001/SRR8797509_1.part_001.fastq -2 ./SRR8797509_X.part_001/SRR8797509_2.part_001.fastq -p 5 -O ./out_unshafeld5 -f
seqkit split2 -1 ./shuffled_srr8797509/shuffled_SRR8797509_1.part_001.fastq -2 ./shuffled_srr8797509/shuffled_SRR8797509_2.part_001.fastq -p 5 -O ./out_shaffeld5 -f
fastqc -t 1 -f fastq -noextract ./out_shaffeld5/shuffled_SRR8797509_2.part_001.part_002.fastq -O ./fastqfile
fastqc -t 1 -f fastq -noextract ./out_shaffeld5/shuffled_SRR8797509_1.part_001.part_001.fastq -O ./fastqfile
fastqc -t 1 -f fastq -noextract ./out_unshafeld5/SRR8797509_1.part_001.part_001.fastq -O ./fastqfile
fastqc -t 1 -f fastq -noextract ./out_unshafeld5/SRR8797509_2.part_001.part_001.fastq -O ./fastqfile
multiqc -z -o ./fastqfile ./fastqfile



