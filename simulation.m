S = 200;
n = 1500;
p = 3;
B = 100;


sigma = [1,0,0;0,1,0;0,0,1] ;
mu = zeros(n,p);
l = zeros(S,1)';
for i = 1:S
    X = mvnrnd(mu,sigma);
    Xbar = mean(X);
    sigmahat = 1/n*X'*X-Xbar*Xbar';
    eigenvalues = eig(sigmahat);
    lamdahat = max(abs(eigenvalues));
    bootinterval = bootstrap(B,X,n,lamdahat);
    disp(bootinterval)
    l(i) = inrange(1, bootinterval , 'includeboth');
    disp(i)
end 
result = 1/S*sum(l);
disp(result)


