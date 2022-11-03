library(MASS)
library(data.table)
S = 200
n = 200
p = 3
sigma <- matrix(c(3,0,0,0,2,0,0,0,1), nrow=3)
X <- mvrnorm(n,c(0,0,0),sigma)

logic = vector("logical",S)
for(i in 1:S){
  X <- mvrnorm(n,c(0,0,0),sigma)
  X.bar = colMeans(X)
  sigmahat = 1/n*t(X)%*%X-X.bar%*%t(X.bar)
  eigenvalues = eigen(sigmahat)$values
  lamdahat = max(abs(eigenvalues))
  boot.interval = boot(200,X,n,lamdahat)
  print(boot.interval)
  logic[i] = 3 %inrange% boot.interval
  print(i)
}
l = unlist(lapply(logic,as.numeric))
result = 1/S*sum(l)
result

 
