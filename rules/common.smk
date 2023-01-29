import pandas as pd

Sample_ids = pd.read_csv(config["samples"])

samples = Sample_ids["Fastq_UI"].to_list()
