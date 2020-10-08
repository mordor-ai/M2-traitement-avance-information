N = length(samples)

# constructing the model
write("
model {
    for (i in 1:N) {
      x[i] ~ dbern(p)
    }
    p ~ dbeta(100, 100) 
}", "pile_ou_face.jags")

# initializing model
#nombre de tirages N
#.chains  combien de fois je veux faire l'experience
#n.adapt : 
model <- jags.model("pile_ou_face.jags", data=list('x'=samples, 'N'=N), n.chains=4, n.adapt=1000)

# sampling from the posterior
samples = coda.samples(model, c('p'), 1000)

s <- ggs(samples)
# affiche le graphe des traces
ggs_traceplot(s) + 
  ggtitle("Affichage de la trace") + 
  theme_bw() +
  theme(legend.title = element_blank())
# affiche la densité
ggs_density(s) +
  ggtitle("Densité empirique") + 
  theme_bw() +
  theme(legend.title = element_blank())

summary(samples)
# 1000 neouds nombre  devariables observées





#exercice 2 :
  
  write("
model {
    for (i in 1:N) {
      for (j in 1:M) {
        x[i, j] ~ dbern(p[t[i]+1])
      }
      t[i] ~ dbern(nu)
    }
    nu ~ dbeta(1, 1)
    p[1] ~ dbeta(5, 1)
    p[2] ~ dbeta(1, 5)
}", "piece_truquee.jags")

# initializing model
model <- jags.model("piece_truquee.jags", data=list('x'=samples, 'N'=N, 'M'=M), n.chains=4, n.adapt=1000)

post_samples = coda.samples(model, c('p', 'nu'), 1000)

s_p <- ggs(post_samples, family='p')
s_nu <- ggs(post_samples, family=c('nu'))

ggs_traceplot(s_p) + 
  ggtitle("Affichage de la trace (p)") + 
  theme_bw() +
  theme(legend.title = element_blank())

ggs_traceplot(s_nu) + 
  ggtitle("Affichage de la trace (nu)") + 
  theme_bw() +
  theme(legend.title = element_blank())

ggs_density(s_p) +
  ggtitle("Densité empirique") + 
  theme_bw() +
  theme(legend.title = element_blank())

for (i in 1:4) {
  print(sum(post_samples[[i]][,1]<0.5)/1000)
}