
all: TrinityFusion-D TrinityFusion-C TrinityFusion-UC




TrinityFusion-D:
	../TrinityFusion --left_fq reads_1.fq.gz --right_fq reads_2.fq.gz  --output_dir TrinityFusion-D_outdir


TrinityFusion-C:
	../TrinityFusion --left_fq reads_1.fq.gz --right_fq reads_2.fq.gz  --output_dir TrinityFusion-C_outdir --chimeric_junctions Chimeric.out.junction


TrinityFusion-UC:
	../TrinityFusion --left_fq reads_1.fq.gz --right_fq reads_2.fq.gz  --output_dir TrinityFusion-UC_outdir --chimeric_junctions Chimeric.out.junction --aligned_bam Aligned.out.bam



TrinityFusion-UC-Singularity:
	singularity exec -e -B /home/bhaas/CTAT_GENOMICS/GRCh37_gencode_v19_CTAT_lib_Aug152019.plug-n-play/ctat_genome_lib_build_dir:/ctat_genome_lib:ro TrinityFusion.simg /usr/local/src/TrinityFusion/TrinityFusion --left_fq reads_1.fq.gz --right_fq reads_2.fq.gz  --output_dir TrinityFusion-UC_outdir-Singularity --chimeric_junctions Chimeric.out.junction --aligned_bam Aligned.out.bam --genome_lib_dir /ctat_genome_lib



clean:
	rm -rf ./TrinityFusion-*outdir
