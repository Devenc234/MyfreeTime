N = 1; % Dimensions
F = @(t,X) zeros(N,1); % Drift
G = @(t,X) eye(N); % diffusion
S = sde(F,G,'startState',zeros(N,1)); % Start at the origin

X = S.simByEuler(1000,'ntrials',1,'Z',@(t,X) RandDir(N));

comet(1:numel(X),X);
plot(1:numel(X),X);
grid on;