# load data and libraries
library(foreach)
library(doFuture)
library(microbenchmark)

# load data and source function that computes GLM for each sample 
data <- read.csv('data.csv')
source("myGLM.R")

# normal function
logitBoot <- function(y, x, n_boot = 5000) {
  # do n_boot random permutations of x and y and return coefficient on x with 
  # the myGLM function
  boot_coefs <- sapply(seq_len(n_boot), myGLM, y, x) 
  
  # remove any computations that led to a warning from glm (i.e. a NULL value)
  boot_coefs <- unlist(boot_coefs)
  
  # compute standard deviation of those estimates and return
  boot_se <- sd(boot_coefs)
  return(boot_se)
}

# parallel function
logitBootParallel <- function(y, x, n_boot = 5000) {
  # do n_boot random permutations of x and y and return coefficient on x with 
  # the myGLM function
  boot_coefs <- foreach(i = seq_len(n_boot), .combine = 'c') %dopar% {
    myGLM(i, y, x)
  } 
  
  # remove any computations that led to a warning from glm (i.e. a NULL value)
  boot_coefs <- unlist(boot_coefs)
  
  # compute standard deviation of those estimates and return
  boot_se <- sd(boot_coefs)
  return(boot_se)
}

# set number of cores and register 
nCores <- 3
plan(strategy = multiprocess, workers = nCores)
registerDoFuture()

# compare timing 
microbenchmark(logitBoot(data$y, data$x), times = 1)
microbenchmark(logitBootParallel(data$y, data$x), times = 1)

# write results to a file 
print("Computation done!")