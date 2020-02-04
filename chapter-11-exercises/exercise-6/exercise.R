# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
avg_delay_by_dest <- flights %>% 
  group_by(dest) %>% 
  summarize(delay_avg = mean(arr_delay, na.rm = TRUE)) %>% 
  select(dest, delay_avg) %>% 
  left_join(airports, by = c("dest" = "faa")) %>% 
  select(dest, delay_avg, name) %>% 
  arrange(-delay_avg)
print(avg_delay_by_dest)

# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
avg_delay_by_airline <- flights %>% 
  group_by(carrier) %>% 
  summarize(delay_avg = mean(arr_delay, na.rm = TRUE)) %>% 
  select(carrier, delay_avg) %>% 
  left_join(airlines, by = "carrier")
print(avg_delay_by_dest)
