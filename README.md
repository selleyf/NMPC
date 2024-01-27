Implementation of Nonlinear Model Predictive Control. See Sélley, Fanni, et al. "Dynamic control of modern, network-based epidemic models." SIAM Journal on applied dynamical systems 14.1 (2015): 168-187.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
msis_eq.m: the epidemic model (given by a system of ODEs)
initial_value.m: computes the initial value for the ODE system from the intuitive parameters (initial mean degree, initial infiection rate)
msis_solver.m: solves the ODE model on the control time horizon
optimization: constructs the cost function that is needed to be minimized to get the optimal control

nmpc.m: master file; computes optimal control + plots results
