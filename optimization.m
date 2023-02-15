function L = optimization(u,y,control10,control20,mu0,mu1)
%OPTIMIZATION: construct cost functional
%Input to lsqnonlin


%Set parameters
N = 50;
p = 1;
gamma = 1;
step = 0.1;
tau = 0.2;


%Calculate predictions for future output
y_new(:,1) = msis_solver(u(1),u(p+1),y,step,tau,gamma);

for j=2:p
   y_new(:,j) = msis_solver(u(j),u(j+p),y_new(:,j-1),step,tau,gamma);
end

delta_u1(1) = u(1) - control10;

%Calculate jumps of the control
for j=2:p
delta_u1(j) = u(j) - u(j-1);
end

delta_u2(1) = u(p+1) - control20;

for j=2:p
delta_u2(j) = u(j+p) - u(j+p-1);
end

%Calculate distance of predictions from the target set
%y_dist = distance_calc(y_new(:,1)');
y_dist = sqrt(y_new(1,1)^2+y_new(2,1)^2+y_new(3,1)^2+(y_new(4,1)-N*5)^2);

%Cost functional
L = [sqrt(mu0)*y_dist sqrt(mu1)*delta_u1 sqrt(mu1)*delta_u2];

     
end
