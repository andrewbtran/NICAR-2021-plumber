library(plumber)

root <- pr("fatal_force/plumber.R")
root
root %>% pr_run()


root <- pr("covid/plumber.R")
root
root %>% pr_run()
