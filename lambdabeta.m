function sigma_ = lambdabeta(n)
     b = 0:0.25:8;
     lambda = cell(n,1);
     sigma = cell(length(b),1);
     diagvector = cell(length(b),1);
     for i = 1:n
         lambda{i} = zeros(length(b),1);
     end
     for i = 1:n
         for j = 1:length(b)
             lambda{i}(j) = i^(-b(j));
         end
     end
     for k = 1:length(b)
         diagvector{k} = zeros(n,1);
     end 
     for k = 1:length(b)
         for i = 1:n
             diagvector{k}(i) = lambda{i}(k);
         end
     end 
     for k = 1:length(b)
         for i = 1:n
             sigma{k} = diag(diagvector{k});
         end
     end 
   
     sigma_ = sigma;
end 