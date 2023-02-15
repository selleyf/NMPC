function y = initial_value(Np,n,I)
%INITIAL_VALUE: Compute initial value
%Input: Np - size of population
%       n  - initial mean degree
%       i  - number of initially infected
%Output: y - vector of initial values for I, IS, II and SS 


IS = n*I*(Np-I)/(Np-1);
II = n*I*(I-1)/(Np-1);
SS = n*(Np-I)*(Np-I-1)/(Np-1);

y = [I IS II SS];

end

