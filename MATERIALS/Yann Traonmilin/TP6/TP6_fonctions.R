setwd
graphics.off()

load("./images.rda")

colscale = gray.colors(200)
matrix
dev.new()
image
fft
cbind
which.min

#Calcul des frequences horizontales et verticales 

x1 = matrix(seq(0,n/2,1),nrow=1)
x2= matrix(-seq(n/2-1,1,-1),nrow=1)
x = cbind(x1,x2)
oney = matrix(rep(1,n),ncol=1)
fx=oney %*% x/n;
fy = t(fx)