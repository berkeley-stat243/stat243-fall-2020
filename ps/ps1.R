## @knitr problem2-part1

n <- 1e7
a <- matrix(rnorm(n), ncol = 100)
a <- round(a, 10)

write.table(a, file = '/tmp/tmp.csv', quote=FALSE, row.names=FALSE,
            col.names = FALSE, sep=',')
save(a, file = '/tmp/tmp.Rda', compress = FALSE)

file.size('/tmp/tmp.csv')
file.size('/tmp/tmp.Rda')

## @knitr problem2-part2

b <- a
dim(b) <- c(1e7, 1)  ## change to one column by adjusting attribute
write.table(b, file = '/tmp/tmp-onecolumn.csv', quote=FALSE,
            row.names=FALSE, col.names = FALSE, sep=',')
file.size('/tmp/tmp-onecolumn.csv')

## @knitr problem2-part3

## First comparison
system.time(a1 <- read.csv('/tmp/tmp.csv', header = FALSE))
system.time(a2 <- read.csv('/tmp/tmp.csv',header = FALSE,
                           colClasses = 'numeric'))
system.time(a3 <- scan('/tmp/tmp.csv', sep = ','))

## @knitr problem2-part4

save(a, file = '/tmp/tmp1.Rda')
file.size('/tmp/tmp1.Rda')
b <- rep(rnorm(1), 1e7)
save(b, file = '/tmp/tmp2.Rda')
file.size('/tmp/tmp2.Rda')


