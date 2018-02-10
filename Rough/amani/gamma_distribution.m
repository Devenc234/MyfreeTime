function gamma_distribution(alpha,beta)
    
    x=1:100; % Duration of data
    pdf=gampdf(x,alpha,beta); % pdf of the gamma distribution
    figure;
    plot(x,pdf);
end