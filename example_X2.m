clear all;
clf;

% Define the boundaries of the problem.
lb=[-5 -5];
ub=[5 5];
V=6;
M=2;
% Use the GA
res=myGA(@(x) benchmark(2,x),V,M,lb,ub);

