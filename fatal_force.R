library(tidyverse)

# download the data

ff <- read_csv("https://github.com/washingtonpost/data-police-shootings/raw/master/fatal-police-shootings-data.csv")

# wrangle it
dc <- ff %>% 
  filter(state=="DC")

# export it
write_csv(dc, "dc.csv")