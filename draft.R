library(parallel)
library(future.apply)

detectCores()


dates_5 <- c("2021-11-30", "2019-02-28")
dates_5



new_dates <- ymd(dates_5)

month(new_dates, label = TRUE)

day(new_dates)
  
formatted_date <- paste0(month(new_dates, label = TRUE), "-", year(new_dates))


dates_1 <- c("2023-04-05", "2019-12-31", "2022-08-14")
dates_1
formatted_dates_1 <- paste0(month(dates_1, label = TRUE), "-", year(dates_1))
formatted_dates_1




# Create a vector of 5 numbers for N rates
numbers <- c(150, 180, 200, 220, 240)

# Randomly select one N rate
random_number <- sample(numbers, 1)

print(random_number)

###=== review function ===###


square_a <- function(a) {
  
  squa <- a^2
  
  return(squa)
  
}

square_a(8)


find_b <- function(c) {
  
  squ_c = c^2
  b = squ_c + 4 
  
  return(b)
  
}

find_b(3)

# Multiple argument

multivar_function <- function(y, z) {
  
  abc = y*3 + z
  
  return(abc)
  
}

multivar_function(3,2)


# exercise 1
fah_cel <- function(f) {
  
  temp_c = (f-32) * 5/9
  
  return(temp_c)
  
}

fah_cel(32)


# exercise 2

corn_yield <- function(N) {
  
  corn_yield = 120 + 25*log(N)
  
  return(corn_yield)
  
}

corn_yield(200)

# lapply(100:250, corn_yield)

# change the above for loop using lappy instead


p_N = 0.6

expect_revenue <- function(N, corn_price) {
  
  corn_yield = 120 + 25*log(N)
  revenue = corn_price*corn_yield - p_N*N
  
  return(revenue)
  
}

 expect_revenue(N = 200, corn_price = 5)


 lapply(seq(100, 250, by = 50), function(N) expect_revenue(N, corn_price = 5))
 
 
 ###====== looping ====###
 
 for (x in 1:10) {
   x_squ = x^2
   
   print(x_squ)
 }
 
 
 for (x in seq(5, 50, by = 5)) {
   
   x_3 = x^3
   
   print(x_3)
   
 }
 
 
 # change the above for loop using lappy instead
 
 get_cube <- function(x) {
   
   x_3 = x^3

   return(x_3)
   
 }

lapply(seq(5, 50, by = 5), get_cube)

# Exercise1 


expect_revenue <- function(N, corn_price) {
  
  corn_yield = 120 + 25*log(N)
  revenue = corn_price*corn_yield - p_N*N
  
  return(revenue)
  
}

future_lapply(seq(2.5, 4, by = 0.1), function(corn_price) expect_revenue(N = 200, corn_price))


###=== A parallel processing example ===###

N = 50000

data_gen <- function(mu, x, v) {
  
mu <- rnorm(N)
x <- rnorm(N) + mu
v <- rnorm(N) + mu

y <- 1 + x + v

ols_data <- data.frame(
  x = x,
  mu = mu,
  v = v, y = y
)

ols_result <- lm(y ~ x, data = ols_data)

beta <- ols_result$coefficients["x"]

return(beta)

}

lapply(1:10, data_gen)












