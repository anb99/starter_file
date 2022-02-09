#### Preamble ####
# Purpose: Gather data from open data Toronto
# Author: Athaliah Biju
# Data: 6 February 2022
# Contact: athaliah.biju@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - None
#### Workspace setup ####

install.packages("tidyverse")
install.packages("janitor") 
install.packages("tidyr") 
install.packages("opendatatoronto")
install.packages("lubridate")
install.packages("knitr")

library(tidyverse)
library(opendatatoronto)


## Gather data

# Based on: https://open.toronto.ca/dataset/neighbourhood-profiles

raw_neighbourhood_data <-
  read_csv(file = "https://ckan0.cf.opendata.inter.prod-toronto.ca/download_resource/ef0239b1-832b-4d0b-a1f3-4153e53b189e?format=csv", show_col_types = FALSE)

write_csv(x = raw_neighbourhood_data, file = "neighbour_data.csv")

# Data Cleaning
clean_neighbourhood_file <-
  clean_names(raw_neighbourhood_data) |> 
  select(topic,characteristic, city_of_toronto) |>
  filter(topic == "Age characteristics")

write_csv(x = clean_neighbourhood_file, file = "clean_neighbour_data.csv")

         