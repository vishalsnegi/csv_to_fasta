

setwd()

filenames <- list.files(pattern="*.csv") #create a vector of filenames with .csv extension
geo <- gsub(".csv", "", filenames) ## remove csv from filenames

for (i in 1:length(filenames)) {
  df <- read.csv(filenames[i], header = TRUE, sep = ",")
  df.fas<-paste0(">", df$seq_name, "|", df$Year_Month,
                 "\n",df$sequence,"\n")
  out_file <- paste0(geo[i], ".fasta")
  writeLines(df.fas, out_file)
}
