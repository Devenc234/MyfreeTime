function chi = chi_from_normal(dof,iteration)
    
    mu = 0;
    sigma = 1;
    
    chi = zeros(iteration,1);
    for i=1:iteration
        y = 0;
        for j=1:1:dof
            temp = normrnd(mu,sigma);
            y = y + temp*temp;
        end
      chi(i,1)= y;
    end

end