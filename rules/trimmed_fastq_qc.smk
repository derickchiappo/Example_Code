rule trimmed_fastq_qc:
    input:
      fq1 = "Workflow/data/trimmed_fastq/{sample}/paired_{sample}_1.fastq.gz",
      fq2 = "Workflow/data/trimmed_fastq/{sample}/paired_{sample}_2.fastq.gz",

    output:
       "workflow/data/fastqc_files/{sample}/"

    conda:
        "../envs/fastqc.yaml"

    shell:
        " mkdir {output} | fastqc -o {output} {input.fq1} {input.fq2} "
