#' ___
#' title: HW2
#' author: Rylie Talmadge
#' date: '`r paste("created on", Sys.Date())`'
#' output: html_document
#' ---
#' 
#' Examine the loop

data(iris)
head(iris)

#' Question 1: Describe the values stored in the object output. In other words what did the loops create?
#' The loops creates a data set of the averages of each row and column

#' Question 2: Describe using pseudo-code how output was calculated

# Use 'unique' for the three species ('species_ids')
sp_ids <- unique(iris$Species)

# This makes a matrix ('output') with the same number of rows as number of species and the number of columns minus 1, and labels them
output <- matrix(0, nrow=length(sp_ids), ncol=ncol(iris)-1)
rownames(output) <- sp_ids
colnames(output) <- names(iris[ , -ncol(iris)])

# Loop through the three species (i.e., 1:length sp_id)
for(i in seq_along(sp_ids)) {
  # subset data down to specific species, drop species column (select=- means all columns except species)
  iris_sp <- subset(iris, subset=Species == sp_ids[i], select=-Species)
  # Loop through the traits
  for(j in 1:(ncol(iris_sp))) {
    x <- 0  
    y <- 0
    # If the number of rows of species is greater than 0...(which they are)
    if (nrow(iris_sp) > 0) {
          # If number of rows is greater than 0, then loop through rows of species
           for(k in 1:nrow(iris_sp)) {
        # x = sum of species
        x <- x + iris_sp[k, j]
        x
        #y = number of rows
        y <- y + 1
        y
           }
      # output = average
      # average = sum of widths (Sigma) divided by the number of widths (N)
      output[i, j] <- x / y 
    }
  }
}
output

#' Question 3: The variables in the loop were named so as to be vague. How can the objects output, x, and y be renamed such that it is clearer what is occurring in the loop.

# 'Output' named as 'trait_avg', 'x' named as 'trait_sum', 'y' named as 'n_samples'.

sp_ids <- unique(iris$Species)

trait_avg <- matrix(0, nrow=length(sp_ids), ncol=ncol(iris)-1)
rownames(trait_avg) <- sp_ids
colnames(trait_avg) <- names(iris[ , -ncol(iris)])

for(i in seq_along(sp_ids)) {
  iris_sp <- subset(iris, subset=Species == sp_ids[i], select=-Species)
  for(j in 1:(ncol(iris_sp))) {
    trait_sum <- 0
    n_samples <- 0
    if (nrow(iris_sp) > 0) {
      for(k in 1:nrow(iris_sp)) {
        trait_sum <- trait_sum + iris_sp[k, j]
        n_samples <- n_samples + 1
      }
      trait_avg[i, j] <- trait_sum / n_samples 
    }
  }
}
trait_avg

#' Question 4: It is possible to accomplish the same task using fewer lines of code? Please suggest one other way to calculate output that decreases the number of loops by 1.

sp_ids <- unique(iris$Species)

trait_avg <- matrix(0, nrow=length(sp_ids), ncol=ncol(iris)-1)
rownames(trait_avg) <- sp_ids
colnames(trait_avg) <- names(iris[ , -ncol(iris)])

for(i in seq_along(sp_ids)) {
  iris_sp <- subset(iris, subset=Species == sp_ids[i], select=-Species)
  for(j in 1:(ncol(iris_sp))) {
      for(k in 1:nrow(iris_sp)) {
      trait_avg[i, j] <- mean(iris_sp[ ,j]) 
    }
  }
}
trait_avg

#' Question 5: You have a vector x with the numbers 1:10. Write a for loop that will produce a vector y that contains the sum of x up to that index of x. So for example the elements of x are 1, 2, 3, and so on and the elements of y would be 1, 3, 6, and so on.
x_vec <- c(1:10)
for (i in x_vec){
  y_vec <- (cumsum(x_vec))
}
y_vec


#' Question 6: Modify your for loop so that if the sum is greater than 10 the value of y is set to NA
x_vec <- 1:10
y_vec <- cumsum(x_vec)
y_vec <- ifelse(y_vec > 10, NA, y_vec)
y_vec


#' Question 7: Place your for loop into a function that accepts as its argument any vector of arbitrary length and it will return y.
sum_vector <- function(x){
  y <- cumsum(x)
  y[y > 10] <- NA
  return(y)
}
x_vec <- 1:10
print(sum_vector(x_vec))
