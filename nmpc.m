function [] = nmpc(step)
%NMPC: Nonlinear Model Predictive Control. See Sélley, Fanni, et al. "Dynamic control of modern, network-based epidemic models." SIAM Journal on applied dynamical systems 14.1 (2015): 168-187.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Input: step - stepsize of the control algorithm
%Output: plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SAMPLE INPUT: nmpc(0.1)


%%Set parameters
N = 50;     %population size
Tmax = 151; %timeframe
gamma = 1;  %recovery rate
tau = 0.2;  %infection rate
mu0 = 1;    %stressing reduction of distance from target set
mu1 = 2;    %stressing small jumps in the control
p = 1;      %time horizon
n = 6;      %initial mean degree
i = 5;      %number of initially infected

M1 = 1000;  %bounds on the control
M2 = 1000;

%Initialization
y = initial_value(N,n,i);

u1 = zeros(p,1);
u2 = zeros(p,1);

%Main part
for t = 1:Tmax

control1(t) = u1(1);    %store executed control
control2(t) = u2(1);

output1(t) = y(1);      %store number of infected
y2(t)= y(2);
y3(t)= y(3);
y4(t)= y(4);
output2(t) = (2*y(2) + y(3) + y(4))/N;  %store mean degree

u_0 = [u1 u2];          %control for the time horizon

control10 = control1(t); %first step of control
control20 = control2(t);

options = optimset('MaxFunEvals',1000);
u = lsqnonlin(@optimization,u_0,[0 -M2],[M1 M2],options,y,control10,control20,mu0,mu1);

u1 = u(1:p);
u2 = u(p+1:2*p);

y_new = msis_solver(u1(1),u2(1),y,step,tau,gamma);
y = y_new;

end


%Plot results


T1 = step*(0:1:Tmax-1); 

grey = [0.5 0.5 0.5];

subplot(2,2,1), plot(T1,output1(1:Tmax),'-r','LineWidth',2)
title('Infected Population','FontSize',16)
xlabel('t','FontSize',14)
ylabel('[I]','FontSize',14)
set(get(gca,'ylabel'),'Rotation',0.0)
xlim([0 15])
set(gca,'FontSize',14)
hold off

subplot(2,2,2), 
for i=1:Tmax-1
plot([(i-1)*step,i*step],[control1(i) control1(i)],'Color',grey,'LineWidth',2)
hold on
end
hold off
xlabel('t','FontSize',14)
ylabel('u^1','FontSize',14)
set(get(gca,'ylabel'),'Rotation',0.0)
xlim([0 15])
set(gca,'FontSize',14)

subplot(2,2,3), plot(T1,output2(1:Tmax),'-r','LineWidth',2)
title('Mean Degree','FontSize',16)
xlabel('t','FontSize',14)
ylabel('n','FontSize',14)
set(get(gca,'ylabel'),'Rotation',0.0)
xlim([0 15])
set(gca,'FontSize',14)
hold off

subplot(2,2,4), 
for i=1:Tmax-1
plot([(i-1)*step,i*step],[control2(i) control2(i)],'Color',grey,'LineWidth',2)
hold on
end
hold off
xlabel('t','FontSize',14)
ylabel('u^2','FontSize',14)
set(get(gca,'ylabel'),'Rotation',0.0)
xlim([0 15])
set(gca,'FontSize',14)


end


