rule bowtie2_map:
    input:
      fq1 = "Workflow/data/trimmed_fastq/{sample}/paired_{sample}_1.fastq.gz",
      fq2 = "Workflow/data/trimmed_fastq/{sample}/paired_{sample}_2.fastq.gz"

    output:
      "workflow/data/bam_files/{sample}.bam"

    log:
      "workflow/data/logs/bowtie2_map/{sample}.log"

    conda:
      "../envs/bowtie2.yaml"

    shell:
      "bowtie2 --very-sensitive-local -p 6 -x GRCm38 -1 {input.fq1} -2 {input.fq2} 2> {log} \
       | samtools view -Sb - > {output}"
