setwd(getwd())

#### Load packages ####
library(tidyverse)
library(opendatatoronto)

#### Get Data ####
# Get List Packages
packages <- list_packages(limit = 100)
View(packages)

# Input Keywords
subway_ttc <- search_packages("ttc subway delay data")
print(subway_ttc)

# Get Resources
subway_ttc_r <- subway_ttc %>%
  list_package_resources()
print(subway_ttc_r)

# Get Latest Data
subway_data <- subway_ttc_r %>%
  tail(1) %>%
  get_resource()

# Print data
head(subway_data, 10)


#### Save Data Into Folder Data ####
# Create the directory if it does not exist
if (!dir.exists("inputs/data")) {
  dir.create("inputs/data", recursive = TRUE)
}
# Now you can write the CSV file
write_csv(subway_data, "inputs/data/raw_data.csv")

