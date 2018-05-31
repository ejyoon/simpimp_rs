library(here)
library(dataMaid)
library(tidyverse)

unique_values <- function(variable) {
  return(paste("unique values are:", paste(unique(variable), collapse=", ")))
}

#### read in dataset
d <- read.csv(here("data_ana/data","final_analyzed_data.csv"))

###### add metadata using attributes 
attr(d$subid, "label") <- "participant ID"
attr(d$age_group, "label") <- "age binned"
attr(d$site, "label") <- "recruitment site"
attr(d$item_num, "label") <- "number of features"
attr(d$item_rel, "label") <- "number of features (relative)"

attr(d$trial_type, "shortDescription") <- unique_values(d$trial_type)
attr(d$item_num, "shortDescription") <- unique_values(d$item_num)
attr(d$item_rel, "shortDescription") <- unique_values(d$item_rel)
attr(d$sample, "shortDescription") <- unique_values(d$sample)

#### generate the codebook
makeCodebook(d, 
             reportTitle = "Codebook for final analyzed data in The role of salience in young children's processing of ad-hoc implicatures",
             replace = TRUE,
             file = "codebook_final_data.Rmd")


