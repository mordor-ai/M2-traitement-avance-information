# revisions
i <- seq(0, 1, 1/1000)
plot(jitter(i,100)  )
prior <-dbeta(i,1,1)
hist(prior)
posterior<- dbeta(i,)



f <- function(a) {
  curve(exp(a*x)-a*x-1, xlim=c(-10,10))
}
par(mfrow=c(2,2))
f(0.1)
f(0.5)
f(1)
f(2)