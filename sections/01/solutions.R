########################################
## Solutions
########################################
# Jared Bennett (jared_bennett@berkeley.edu)
# 20190902
# half provided previously, half written new
# formatting updated to correspond with problem numbers

####################
## Creating datastructures
####################

##########
# 1
##########
# a
1:50

# b
!as.logical(1:50%%2)

# c
50:1

# d
c(1:50, 49:1)

# e
-10:10

# f
3*1:16
seq(3, 48, by=3)

# g
as.character(3*1:16)

# h
rep(c("a","b","c","d"), c(4,3,2,1))

# i
factor(rep(c("a","b","c","d"), c(4,3,2,1)))

# j
seq(-1,1, length.out=200)

##########
# 2
##########
# a
x = 1:50

# b
y = cos(x)

# c
z = tan(y)

# d
w = y*z

# e
f = x %in% 10:29

# f
df1 = data.frame(x=x, y=y, z=z, w=w, f=f)

# g
names(df1) = toupper(names(df1))

# h
df1 = data.frame(y=y, z=z, w=w, f=f)
# if x != 1:50, then you would need to additional do:
# row.names(df1) = x

####################
## Subsetting datastructures
####################

##########
# 1
##########
# a
m1 = df1[sapply(df1, is.numeric)]

# b
m2 = m1[f, ]

# c
df2 = df1[df1$z >= 0, names(df1) != 'z']

# d
df3 = df1[-c(3,17), ]

# e
df4 = df1[seq(2,nrow(df1),2), ]

####################
## Vectorized calculations
####################

##########
# 1
##########

x = seq(1,3,.1)
exp(2*x)*x^sqrt(x)

##########
# 2
##########
# a
x = matrix(0, 5, 5)

# b
row(x)
col(x)

# c
y = x
y[abs(row(x)-col(x))==1] = 1

# d
abs(row(x)-col(x))

##########
# 3
##########
# a
outer(0:4, 0:4, "+")

# b
outer(0:4, 0:4, "+")%%5

####################
## Using apply, sapply, and lapply
####################

##########
# 1
##########
# a
m1 <- matrix(data = runif(n = 30, min = 1, max = 100), nrow = 5, ncol = 6)

# b
m2 <- apply(X = m1, MARGIN = 1, FUN = function(x){x/sum(x)})
dim(m2) # they are not the same, R is column major
# better
m2 <- t(apply(X = m1, MARGIN = 1, FUN = function(x){x/sum(x)}))
dim(m2) # they are the same
# best
m2 <- m1/rowSums(x = m1)

# c
apply(X = m2, MARGIN = 1, FUN = function(x){sum(x) == 1})

# d
m2 <- apply(X = m1, MARGIN = 2, FUN = function(x){x/sum(x)})
dim(m2) # they are the same
apply(X = m2, MARGIN = 2, FUN = function(x){sum(x) == 1})

##########
# 2
##########
# a
x <- seq.int(from = 1, to = 10, by = 0.1)

# b
y <- 2*x + rnorm(n = length(x))

# c
plot(x,y)

# d
myLm <- lm(y ~ x)

# e
lapply(X = myLm, FUN = "class")

# f
sapply(X = myLm, FUN = "class")

# g
# They are the same here, because a list is the best simplified type of object.
#  sapply is a "simplified apply", ie, the output is simiplified to something 
#  deemed intelligent, like a vector or a list etc. 



####################
## functions
####################

##########
# 1
##########
# 0
AbsMedDiff <- function(x){
	return(sum( abs(x - median(x = x) )) )
}

# a
AbsMedDiff2 <- function(x){
	# check if numeric
	stopifnot(is.numeric(x = x))
	
	# if numeric, do work
	return(sum( abs(x - median(x = x) )) )
}

# b
AbsMedDiff3 <- function(x, na.rm = FALSE){
	# check if numeric
	stopifnot(is.numeric(x = x))
	
	# remove NA if true
	if(na.rm){x <- na.omit(x)}
	
	# if numeric, do work
	return(sum( abs(x - median(x = x) )) )
}

AbsMedDiff3a <- function(x, na.rm = FALSE){
	# check if numeric
	stopifnot(is.numeric(x = x))
	
	# if numeric, do work
	return(sum( abs(x - median(x = x, na.rm = na.rm) ), na.rm = na.rm) )
}

##########
# 2
##########
# a
x <- sample(x = 0:1, size = 100, replace = TRUE)
y <- sample(x = 0:1, size = 100, replace = TRUE)

# setting the seed would make it reproducible.

# b
SumHeads <- function(numFlips){
	# do flipping
	x <- sample(x = c(0,1), size = numFlips, replace = TRUE)
	
	# return heads
	return(sum(x))
}

# it doesn't m ake sense to call set.seed within the function

# c
sumsVec <- replicate(n = 10000, expr = SumHeads(numFlips = 200))

# d
hist(sumsVec)

##########
# 3
##########
basicFunc <- function(x,y,operation = "add"){
	
	switch(operation,
				 "add" = x+y,
				 "subtract" = x-y,
				 "multiply" = x*y,
				 "divide" = x/y,
				 "Warning: Not a designated option")
}

##########
# 4
##########

JaredCumSum <- function(x){
	
	# setup return vector
	retVec <- numeric(length = length(x)-1)
	
	# set first element
	retVec[1] <- x[1]
	
	# loop over rest
	for(i in 2:length(x)){
		retVec[i] <- retVec[i-1] + x[i]
	}
	
	# return result
	return(retVec)
	
}

####################
## Loading (and saving) data
####################

