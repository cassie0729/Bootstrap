function bootinterval = bootstrap(B,X,n,lamdahat)
     lamdahatboot = repelem(0,B);
  for i = 1:B
      bootindices = randsample(n,n,true);
      Xboot = X(bootindices,:);
      Xbarboot = mean(Xboot);
      sigmahatboot = 1/n*Xboot'*Xboot-Xbarboot*Xbarboot';
      eigenvalues = eig(sigmahatboot);
      lamdahatboot(i) = max(abs(eigenvalues));
  end
  
  diff = lamdahatboot-lamdahat;
  a = quantile(diff, 0.025);
  b = quantile(diff, 0.975);  
  
  bootinterval = [lamdahat-b lamdahat-a];
end 