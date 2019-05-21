
all: TrinityFusion-D TrinityFusion-C TrinityFusion-UC




TrinityFusion-D:
	../TrinityFusion --left_fq reads_1.fq.gz --right_fq reads_2.fq.gz  --output_dir TrinityFusion-D_outdir


TrinityFusion-C:
	../TrinityFusion --left_fq reads_1.fq.gz --right_fq reads_2.fq.gz  --output_dir TrinityFusion-C_outdir --chimeric_junctions Chimeric.out.junction


TrinityFusion-UC:
	../TrinityFusion --left_fq reads_1.fq.gz --right_fq reads_2.fq.gz  --output_dir TrinityFusion-UC_outdir --chimeric_junctions Chimeric.out.junction --aligned_bam Aligned.out.bam




clean:
	rm -rf ./TrinityFusion-*outdir
