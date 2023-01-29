rule fastq_trim:
    input:
      fq1 = "Workflow/data/fastq/{sample}/{sample}_1.fastq.gz",
      fq2 = "Workflow/data/fastq/{sample}/{sample}_2.fastq.gz"

    output:
      paired_fq1 = "Workflow/data/trimmed_fastq/{sample}/paired_{sample}_1.fastq.gz",
      paired_fq2 = "Workflow/data/trimmed_fastq/{sample}/paired_{sample}_2.fastq.gz",
      unpaired_fq1 = "Workflow/data/trimmed_fastq/{sample}/unpaired_{sample}_1.fastq.gz",
      unpaired_fq2 = "Workflow/data/trimmed_fastq/{sample}/unpaired_{sample}_2.fastq.gz"

    log:
      "WorkFlow/data/logs/fastq_trim/{sample}/{sample}.log"

    conda:
      "../envs/fastq_trim.yaml"

    shell:
      " trimmomatic PE \
      {input.fq1} {input.fq2} \
      {output.paired_fq1} {output.unpaired_fq1} \
      {output.paired_fq2} {output.unpaired_fq2} \
      SLIDINGWINDOW:4:20 2> {log} "
