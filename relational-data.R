# PRACTICE WORKING WITH RELATIONAL DATA
# Ch. 13 (1st Ed) https://r4ds.had.co.nz/relational-data.html#nycflights13-relational
# Ch. 19 (2nd Ed) https://r4ds.hadley.nz/joins

# uncomment and run if nycflights13 is not already installed
# install.packages("nycflights13")

# load required packages
library(nycflights13)
library(tidyverse)


# QUESTION 1. Is there a relationship between the age of a plane and its departure delays?

# step 1: 
# inspect the data frames -- which variables do you need to solve the problem?
# this is a key step, spend some time looking at the tables and the variables they have in common 
# refer back to the slides or to Ch. 19 from our book (link at the top of this file) for details


# step 2: 
# use mutate() and the appropriate variables to calculate age using the planes table 
# then select the required variables from the planes table
# hint: you will notice that there is not an age variable in the data, but we can calculate it:
# this data is from 2013: we can use this info together with the variable year to calculate age


# step 3: 
# use inner_join() to combine the data frames
# generate a graph to shows the relationship between the required variables, use a smoothing line geom




# QUESTION 2. Imagine you wanted to draw the route each plane flies from its origin to its destination. 
# What variables would you need? What tables would you need to combine?


