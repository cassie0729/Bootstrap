S = 300;
n = 200;
p = 200;
B = 100;
b = 0:0.25:8;
sigma_ = lambdabeta(p);
mu = zeros(n,p);
l = zeros(S,1)';
result = zeros(length(b),1)';
for k = 1:length(b)
    for i = 1:S
        X = mvnrnd(mu,sigma_{k});
        Xbar = mean(X);
        sigmahat = 1/n*X'*X-Xbar*Xbar';
        eigenvalues = eig(sigmahat);
        lamdahat = max(abs(eigenvalues));
        bootinterval = bootstrap(B,X,n,lamdahat);
        disp(bootinterval)
        l(i) = inrange(1, bootinterval , 'includeboth');
        disp(i)
    end 
    result(k) = 1/S*sum(l);
    disp(result)
    disp(k)
end 
plot(b,result,'-ro')
hold on
yline(0.95)
hold off
xlabel('beta')
ylabel('level of confidence')
title('Plot of beta-confidence')

