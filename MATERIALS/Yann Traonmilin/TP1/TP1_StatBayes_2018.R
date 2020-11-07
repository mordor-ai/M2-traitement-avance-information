# TP1 - Statistique Bayesienne
# ferme tous les graphiques avant de relancer  
graphics.off()

# Paramètres de simulation 
# nombre de tests de la machine à sous 
n = 1000 
theta1=!XXX!
theta2=!XXX!
# simulation des deux cas
Xmalhonnete = rbinom(n,1,theta1)
Xhonnete = !XXX!

# Loi a priori 
mu = !XXX!
  
# approche frequentiste ####################################################
xaxis = seq(1,n)
maxlik_est_mal= seq(1,n)
maxlik_est_hon= seq(1,n)

for (i in 1:n) {
 # Calcul de   la moyenne empirique pour les expérience de 1 à i 
  maxlik_est_mal[i] = mean(Xmalhonnete[1:i])
  maxlik_est_hon[i] = !XXX!
  
}


# graphe
dev.new()
plot(xaxis,maxlik_est_mal,type="l",col="blue", xlab="k",ylim=c(0, 1),ylab="est. theta malhonnete(bleu), est. theta honnete (rouge)", sub="est. du max de vraisemblance ")
lines(xaxis,maxlik_est_hon,type="l",col="red")



# Calcule et affiche la loi a posteriori (empirique) ####################################################
xaxis = seq(1,n)
post = seq(1,n)
# cas malhonnete ####################
for (i in 1:n) {
  k = sum(Xmalhonnete[1:i])
  # Calcul de la loi a posteriori pour theta1 les expérience de 1 à i 
  post[i] = !XXX!
}
dev.new()
plot(xaxis,post,type="l",col="blue", xlab="k",ylim=c(0, 1),ylab="P(theta1|X) (bleu), P(theta2|X) (rouge)",sub="Cas malhonnête")

# calcul de la loi a posterori pour theta2
post2 = !XXX!
# plot sur le même graphe
lines(xaxis,post2,type="l",col="red")


# cas honnete ####################
xaxis = seq(1,n)
post = rep(0,n)
for (i in 1:n) {
  k = sum(Xhonnete[1:i])
  post[i] = !XXX!
}

dev.new()
plot(xaxis,post,type="l",col="blue", xlab="k",ylim=c(0, 1),ylab="P(theta1|X) (bleu), P(theta2|X) (rouge)",sub="Cas honnête")

post2 =!XXX!

lines(xaxis,post2,type="l",col="red")


# changement de l'a priori  ####################################################

xaxis = seq(1,n)
post = rep(0,n)
mutest= seq(0.1,0.9,by=0.2) 
xmax =!XXX!
dev.new()
plot(xaxis[1:xmax],post[1:xmax],type="l",col="white", xlab="k",ylim=c(0, 1),ylab="P(theta1|X) ",sub="influence de mu")
mycol =seq(1,length(mutest))
for (m in 1:length(mutest)){
for (i in 1:n) {
  k = sum(Xmalhonnete[1:i])
  # Calcul de la loi a posteriori pour theta1 les expérience de 1 à i pour un mu donné 
  post[i] =!XXX!
}
lines(xaxis[1:xmax],post[1:xmax],type="l",col=mycol[m])
}

legend('right', 
       legend=paste('mu=',mutest, sep=''),
       col=mycol, lwd=3)




# charge les donnees X,Y,Z
# !XXX! Télécharger le fichier suivant dans le dossier courant  https://drive.google.com/open?id=1SVoZT7qVqZgWwLzI4ilzWPquKQ_VVQNA

 #charge X,Y,Z 
 load(file = "~/WORK/Enseignement/Stat_bayesienne/TP_Yann_Traonmilin/TP1/TP1_stat_bayes.rda")

# jeux de données X ####################################################
n = length(X) # nombre de test de la machine à sous 
theta1=!XXX!
theta2=!XXX!

mu = !XXX!

xaxis = seq(1,n)
post = rep(0,n)
for (i in 1:n) {
  k = !XXX!
  post[i] =!XXX!
}
dev.new()
plot(xaxis,post,type="l",col="blue", xlab="k",ylim=c(0, 1),ylab="P(theta1|X) (bleu), P(theta2|X) (rouge)",sub="Données X")
post2 = 1-post
# plot sur le même graphe
lines(xaxis,post2,type="l",col="red")



# jeux de données Y ####################################################


n = !XXX! # nombre de test de la machine à sous 
theta1=!XXX!
theta2=!XXX!
mu =!XXX!



xaxis = seq(1,n)
post = rep(0,n)
for (i in 1:n) {
  k = !XXX!
  post[i] = !XXX!
}
dev.new()
plot(xaxis,post,type="l",col="blue", xlab="k",ylim=c(0, 1),ylab="P(theta1|X) (bleu), P(theta2|X) (rouge)",sub="Données Y")
post2 = !XXX!
# plot sur le même graphe
lines(xaxis,post2,type="l",col="red")

# jeux de données Z ####################################################

n = !XXX!# nombrer de test de la machine à sous 
theta1=!XXX!
theta2=!XXX!
mu =!XXX!



xaxis = seq(1,n)
post = rep(0,n)
for (i in 1:n) {
  k =!XXX!
  post[i] = !XXX!
}
dev.new()
plot(xaxis,post,type="l",col="blue", xlab="k",ylim=c(0, 1),ylab="P(theta1|X) (bleu), P(theta2|X) (rouge)",sub="Données Z")
!XXX!
# plot sur le même graphe
lines(xaxis,post2,type="l",col="red")


