#* @apiTitle WaPo Vaccinations API
#* @apiDescription Example of an API using vaccinations data

library(plumber)
library(tidyverse)

cov <- read_csv("https://github.com/nytimes/covid-19-data/raw/master/us-states.csv")

#' Return chart of covid cases by state
#' @param state If provided, filter the data to only this state (e.g. "New York")
#' 
#' @tag viz
#' @serializer png
#' @get state_plot
function(state) {
  state_name <- str_to_title(state)
  
  df <- filter(cov, state==state_name) %>% 
    arrange(date) %>% 
    mutate(cases_new=cases-lag(cases)) 
  
  m <- ggplot(df, aes(x=date, y=cases_new)) +
    geom_col() +
    labs(title=paste0("Daily Covid-19 cases in ", state_name),
         caption="Data: The New York Times", y="Covid-19 cases") 
  print(m)
}
