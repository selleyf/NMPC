function dy = msis_eq(t,y,u1,u2,N,tau,gamma)
%SIS_EQ: the equation 
%Input: u1  - control 1
%       u2  - control 2 
%       N   - size of population
%       tau - infection rate
%
%y(1) = I
%y(2) = SI
%y(3) = II
%y(4) = SS


dy = zeros(4,1);    
dy(1) = tau*y(2) - gamma*y(1);
dy(2) = gamma*(y(3) - y(2)) + tau*(((((2*y(2)+y(3)+y(4))/N) - 1)/((2*y(2)+y(3)+y(4))/N))*((y(4)*y(2))/(N - y(1))) - ((((2*y(2)+y(3)+y(4))/N) - 1)/((2*y(2)+y(3)+y(4))/N))*((y(2)*y(2))/(N - y(1))) - y(2)) - u1*y(2);%min(u1,0)*y(2);
dy(3) = -2*gamma*y(3) + 2*tau*(((((2*y(2)+y(3)+y(4))/N) - 1)/((2*y(2)+y(3)+y(4))/N))*((y(2)*y(2))/(N - y(1))) + y(2));
dy(4) = 2*gamma*y(2) - 2*tau*(((((2*y(2)+y(3)+y(4))/N) - 1)/((2*y(2)+y(3)+y(4))/N))*((y(4)*y(2))/(N - y(1)))) + max(u2,0)*((N - y(1))*(5 - y(1)) - y(4)) + min(u2,0)*y(4);
