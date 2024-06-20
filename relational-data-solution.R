# PRACTICE WORKING WITH RELATIONAL DATA - SOLUTIONS
# Ch. 13 (1st Ed) https://r4ds.had.co.nz/relational-data.html#nycflights13-relational
# Ch. 19 (2nd Ed) https://r4ds.hadley.nz/joins

# uncomment and run if nycflights13 is not already installed
# install.packages("nycflights13")

# load required packages
library(nycflights13)
library(tidyverse)


# QUESTION 1. Is there a relationship between the age of a plane and its departure delays?

# step 1: 
# inspect the data frames: which tables and variables do you need to solve the problem?
# this is a key step, spend some time looking at the tables and the variables they have in common 
# refer back to the slides or to Ch. 19 from our book (link at the top of this file) for details
glimpse(flights)
glimpse(planes)

# step 2: 
# use mutate() and the appropriate variables to calculate age using the planes table 
# then select() the required variables from the planes table
# hint: you will notice that there is not an age variable in the data, but we can calculate it:
# this data is from 2013: we can use this info together with the variable year to calculate age
plane_ages <- planes %>%
    mutate(age = 2013 - year) %>%
    select(tailnum, age)
plane_ages

# step 3: 
# use inner_join() to combine the data frames 
# generate a graph to shows the relationship between the required variables
# use a smoothing line with geom_smooth()
flights %>%
  inner_join(y = plane_ages) %>%
  ggplot(mapping = aes(x = age, y = dep_delay)) +
  geom_smooth()



# QUESTION 2. Imagine you wanted to draw the route each plane flies from its origin to its destination. 
# What variables would you need? What tables would you need to combine?
  
# step 1: inspect the data frames 
glimpse(flights)
glimpse(airports)

# step 2: 
# we need lat and lon of both the origin and destination airports of each flight, thus we need: 
# the flights table (which has `origin` and `dest` of each flight)
# and the airports table (which has `lon` and `lat` of each airport)
# to get the lat and lon for the origin and destination of each flight, we need two joins for flights to airports:
# once for the lat and lon of the origin airport, and once for the lat and lon of the destination airport
# inner_join() to drop any flights with missing airports, can also use left_join()
flights_latlon <- flights %>%
  inner_join(select(airports, 
                    origin = faa, 
                    origin_lat = lat, 
                    origin_lon = lon), by = "origin") %>%
  inner_join(select(airports, 
                    dest = faa, 
                    dest_lat = lat, 
                    dest_lon = lon), by = "dest")
