function [y_new] = msis_solver(u1,u2,y,step,tau,gamma)
%MSIS_SOLVER: solve system on interval [0 step]
%Input: u1   - control 1
%       u2   - control 2
%       y    - initial value
%       step - control stepsize
%       tau  - infection rate

N = 50;

[T,Y] = ode45(@msis_eq,[0 step], y, [], u1, u2, N, tau, gamma);

I = Y(:,1);
r1 = length(I);

IS = Y(:,2);
r2 = length(IS);

II = Y(:,3);
r3 = length(II);

SS = Y(:,4);
r4 = length(SS);

y_new=[I(r1); IS(r2); II(r3); SS(r4)];


