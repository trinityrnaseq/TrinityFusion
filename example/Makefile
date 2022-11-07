
all: TrinityFusion-D TrinityFusion-C TrinityFusion-UC




TrinityFusion-D:
	../TrinityFusion --left_fq reads_1.fq.gz --right_fq reads_2.fq.gz  --output_dir TrinityFusion-D_outdir


TrinityFusion-C:
	../TrinityFusion --left_fq reads_1.fq.gz --right_fq reads_2.fq.gz  --output_dir TrinityFusion-C_outdir --chimeric_junctions Chimeric.out.junction


TrinityFusion-UC:
	../TrinityFusion --left_fq reads_1.fq.gz --right_fq reads_2.fq.gz  --output_dir TrinityFusion-UC_outdir --chimeric_junctions Chimeric.out.junction --aligned_bam Aligned.out.bam



TrinityFusion-UC-Singularity:
	singularity exec -e -B ${CTAT_GENOME_LIB}:/ctat_genome_lib:ro TrinityFusion.simg /usr/local/src/TrinityFusion/TrinityFusion --left_fq reads_1.fq.gz --right_fq reads_2.fq.gz  --output_dir TrinityFusion-UC_outdir-Singularity --chimeric_junctions Chimeric.out.junction --aligned_bam Aligned.out.bam --genome_lib_dir /ctat_genome_lib

trinityFusion-UC-Docker:
	docker run --rm -v `pwd`:/data -v ${CTAT_GENOME_LIB}:/ctat_genome_lib:ro trinityctat/trinityfusion /usr/local/src/TrinityFusion/TrinityFusion --left_fq /data/reads_1.fq.gz --right_fq /data/reads_2.fq.gz  --output_dir /data/TrinityFusion-UC_outdir-Docker --chimeric_junctions /data/Chimeric.out.junction --aligned_bam /data/Aligned.out.bam --genome_lib_dir /ctat_genome_lib


clean:
	rm -rf ./TrinityFusion-*outdir ./TrinityFusion-UC_outdir-Docker/
