<head> 
<h1> Implementation of Nonlinear Model Predictive Control. </h1> 
<p> See Sélley, Fanni, et al. "Dynamic control of modern, network-based epidemic models." SIAM Journal on applied dynamical systems 14.1 (2015): 168-187. </p>
</head>
<body>
<ul>
<li> msis_eq.m: the epidemic model (given by a system of ODEs) </li>
<li> initial_value.m: computes the initial value for the ODE system from the intuitive parameters (initial mean degree, initial infiection rate) </li>
<li> msis_solver.m: solves the ODE model on the control time horizon </li>
<li> optimization: constructs the cost function that is needed to be minimized to get the optimal control </li>
<li> nmpc.m: master file; computes optimal control + plots results </li>
</ul>
</body>
