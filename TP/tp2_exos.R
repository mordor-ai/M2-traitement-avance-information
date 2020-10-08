# exo 1
library(tidyverse, quietly = TRUE)
N = 10000000
samples <- data.frame(x=runif(N, 0, 1), y=runif(N, 0, 1))
samples <- samples %>% 
  mutate(
    circle = if_else(x**2 + y**2 < 1, 'in', 'out')
  )
head(samples)
subset(samples, circle=="in")
count( subset(samples, circle=="in"))/count(samples)*4


#exo 2 

#Question 1 : Soit une loi normale N(0,1), tracer un histogramme pour un échantillon de taille 1000.

X <- data.frame(samples=rnorm(1000, 0, 1))
ggplot(data=X,mapping = aes(x = samples,y = ..density..)) + 
  geom_histogram(alpha = 0.5, color ='black',position = 'identity', bins = 30) +
  labs(title = 'Échantillons du modèle gaussien') +
  theme_bw() +
  xlab('x') +
  theme(legend.title = element_blank())

#Question 2 : En vous appuyant sur l’échantillon précédent, calculer son espérance empirique, sa variance (avec et sans biais). La fonction R var est-elle avec ou sans biais (justifiez) ?

# esperance empirique 



 X <- data.frame(samples=rnorm(10, 0, 1))
my_variance <- function(s, unbiased=TRUE) {
  mu = mean(s);
  normalization = 1
  if (unbiased == TRUE) {
    normalization = (nrow(X) - 1) / nrow(X)
  }
  mean((s-mu)**2) / normalization
}

print 
print(paste('Moyenne empirique:', mean(X$samples)))
print(paste('Ma variance:', my_variance(X$samples)))
print(paste('Ma variance (biaisée):', my_variance(X$samples, unbiased=FALSE)))
print(paste('Variance R:', var(X$samples)))
print(paste('excrat variance biais /sans biais',(var(X$samples)-my_variance(X$samples, unbiased=FALSE))/var(X$samples)*100,'%'))

#question 3 : Via notre échantillon, estimer la probabilité de |X|>2.

X <- data.frame(samples=rnorm(10, 0, 1))









