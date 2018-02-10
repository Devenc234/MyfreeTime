function simulateRVs(T)

a=0;
b=1;
lambda = 1;

for i=1:T
uniform_rv(i,1) = UniformRV(a,b);
normal_rv(i,1) = StandardNormal();
exponential_rv(i,1) = ExponentialRV(lambda);
end

    fprintf('####################################################');
    fprintf('           using Matlab Routine                     ');
    fprintf('####################################################');

nbins = 25;
h = histogram(uniform_rv,nbins);
title('Histogram of Uniform RV with [0,1]');
fprintf('For Uniform RV: \n');
fprintf('computed mean: %f , therotical mean = %f \n',mean(uniform_rv),(a+b)/2);
fprintf('computed variance: %f , therotical variance = %f \n',var(uniform_rv),(b-a)*(b-a)/12);

figure;
h = histogram(normal_rv);
title('Histogram of Normal RV with mean = 0 and var = 1');
mean_nrv = mean(normal_rv);
var_nrv = var(normal_rv);
fprintf('For Normal RV: \n')
fprintf('computed mean: %f , therotical mean = %f \n',mean_nrv,0);
fprintf('computed variance: %f , therotical variance = %f \n',var_nrv,1);

figure;
h = histogram(exponential_rv);
title('Histogram of Exponential RV with lambda = 1');
fprintf('For Exponential RV: \n')
fprintf('computed mean: %f , therotical mean = %f \n',mean(exponential_rv),lambda);
fprintf('computed variance: %f , therotical variance = %f \n',var(exponential_rv),lambda);

end