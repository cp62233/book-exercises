# Exercise 1: working with data frames (review)

# Install devtools package: allows installations from GitHub
#install.packages("devtools")

# Install "fueleconomy" dataset from GitHub
#devtools::install_github("hadley/fueleconomy")

# Use the `libary()` function to load the "fueleconomy" package
library(fueleconomy)
library(dplyr)
data("vehicles")

# You should now have access to the `vehicles` data frame
# You can use `View()` to inspect it
View(vehicles)

# Select the different manufacturers (makes) of the cars in this data set. 
# Save this vector in a variable
makes <- select(vehicles, make)

# Use the `unique()` function to determine how many different car manufacturers
# are represented by the data set
nrow(unique(makes))

# Filter the data set for vehicles manufactured in 1997
vehicles_1997 <- filter(vehicles, year == 1997)

# Arrange the 1997 cars by highway (`hwy`) gas milage
# Hint: use the `order()` function to get a vector of indices in order by value
# See also:
# https://www.r-bloggers.com/r-sorting-a-data-frame-by-the-contents-of-a-column/
vehicles_1997 <- arrange(vehicles_1997, hwy)

# Mutate the 1997 cars data frame to add a column `average` that has the average
# gas milage (between city and highway mpg) for each car
vehicles_1997 <- mutate(
  vehicles_1997,
  average = (vehicles_1997$hwy + vehicles_1997$cty)/2
)

# Filter the whole vehicles data set for 2-Wheel Drive vehicles that get more
# than 20 miles/gallon in the city. 
# Save this new data frame in a variable.
vehicles_2wd <- vehicles[vehicles$drive == "2-Wheel Drive", ]
efficient_2wd <- vehicles_2wd[vehicles_2wd$cty > 20, ]



# Of the above vehicles, what is the vehicle ID of the vehicle with the worst 
# hwy mpg?
# Hint: filter for the worst vehicle, then select its ID.
hello <- vehicles_2wd[vehicles_2wd$hwy == min(vehicles_2wd$hwy), ]


# Write a function that takes a `year_choice` and a `make_choice` as parameters, 
# and returns the vehicle model that gets the most hwy miles/gallon of vehicles 
# of that make in that year.
# You'll need to filter more (and do some selecting)!
get_most_hwy <- function(year_choice, make_choice){
  cars_make <- vehicles[vehicles$make == make_choice , ]
  cars_make_year <- cars_make[cars_make$year == year_choice, ]
  cars_make_year[cars_make_year$hwy == max(cars_make_year$hwy), ]
}

# What was the most efficient Honda model of 1995?
print(get_most_hwy("1995", "Honda"))
