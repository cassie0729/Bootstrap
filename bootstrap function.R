boot <- function (B,X,n,lamdahat){
  lamdahat.boot = rep(NA,B)
  for(i in (1:B)){
    boot.indices = sample(n,replace = TRUE)
    X.boot = X[boot.indices,]
    X.bar.boot = colMeans(X.boot)
    sigmahat.boot = 1/n*t(X.boot)%*%X.boot-X.bar.boot%*%t(X.bar.boot)
    eigenvalues = eigen(sigmahat.boot)$values
    lamdahat.boot[i] = max(abs(eigenvalues))
  }
  diff = lamdahat.boot-lamdahat
  a = quantile(diff, probs = 0.025)
  b = quantile(diff,probs = 0.975)
  return(range(lamdahat-b, lamdahat-a))
}

