
library(tidyverse)

#https://github.com/nytimes/covid-19-data
cov <- read_csv("https://github.com/nytimes/covid-19-data/raw/master/us-states.csv")

# transform the data so it's not cumulative
df <- cov %>% 
  filter(state=="Texas") %>% 
  arrange(date) %>% 
  mutate(cases_new=cases-lag(cases)) 

# make a quick and dirty chart
ggplot(state, aes(x=date, y=cases_new)) +
  geom_col() 
  
