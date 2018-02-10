clear all;
clc

%% Using Matlab Routine

% it will run very fast
T=100;
simulateRVs(T);

% it can take about two minutes
T = 1000;
simulateRVs(T);

% it can take about ten minutes
T = 10000;
simulateRVs(T);

%% Using Rejection method

% it will run very fast
T=100;
SimulateRVs_rejectionMethod(T);

% it can take about two minutes
T = 1000;
SimulateRVs_rejectionMethod(T);

% it can take about ten minutes
T = 10000;
SimulateRVs_rejectionMethod(T);

