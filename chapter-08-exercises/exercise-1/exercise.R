# Exercise 1: creating and accessing lists

# Create a vector `my_breakfast` of everything you ate for breakfast
my_breakfast <- c("sandwich", "juice")

# Create a vector `my_lunch` of everything you ate (or will eat) for lunch
my_lunch <- c("steak", "7up")

# Create a list `meals` that has contains your breakfast and lunch
meals <- list(
  breakfast = my_breakfast,
  lunch = my_lunch
  )

# Add a "dinner" element to your `meals` list that has what you plan to eat 
# for dinner
my_dinner <- c("salad", "apple")
meals <- c(meals, my_dinner)

# Use dollar notation to extract your `dinner` element from your list
# and save it in a vector called 'dinner'
meals$dinner <- c("salad", "apple")

# Use double-bracket notation to extract your `lunch` element from your list
# and save it in your list as the element at index 5 (no reason beyond practice)
meals[5] = NULL
meals[[5]] = meals$lunch

# Use single-bracket notation to extract your breakfast and lunch from your list
# and save them to a list called `early_meals`
early_meals <- list(
  meals[1:2]
)


### Challenge ###

# Create a list that has the number of items you ate for each meal
# Hint: use the `lappy()` function to apply the `length()` function to each item

length(meals$breakfast)
length(meals$lunch)
length(meals$dinner)

numbers_of_meals <- lapply(meals, length)
print(numbers_of_meals)

# Write a function `add_pizza` that adds pizza to a given meal vector, and
# returns the pizza-fied vector
add_pizza <- function(meal_vector){
  new_vector <- c(meal_vector, "pizza")
  return(new_vector)
}

# Create a vector `better_meals` that is all your meals, but with pizza!
lapply(meals,add_pizza)
