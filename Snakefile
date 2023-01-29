from snakemake.utils import min_version

min_version("7.18.0")

configfile: "config/config.yaml"

include: "rules/common.smk"
include: "rules/fastq_trim.smk"
include: "rules/trimmed_fastq_qc.smk"
include: "rules/bowtie2_map.smk"

rule all:
    input:
        expand("workflow/data/fastqc_files/{sample}/",sample = samples),
        expand( "workflow/data/bam_files/{sample}.bam",sample = samples)
