% define the function handle
 Ub = 6; R0 = 1000; R15 = 9000; alpha = 0.99; beta = 1e-6; 
 Uf = 0.026; c1 = 1e-6; c2 = 2e-6; c3 = 3e-6;
 M = [-c1,  c1,   0,   0,   0
       c1, -c1,   0,   0,   0
        0,   0, -c2,   0,   0
        0,   0,   0, -c3,  c3
        0,   0,   0,  c3, -c3];

 Ue = @(t) 0.4 * sin(200 * pi * t);
 f23 = @(u) beta * (exp((u(2) - u(3)) / Uf) - 1);
 dudt = @(t, u)[-(Ue(t) - u(1))/R0
                -(Ub/R15 - u(2)*2/R15 - (1-alpha)*f23(u))
                -(f23(u) - u(3)/R15)
                -((Ub - u(4))/R15 - alpha*f23(u))
                u(5)/R15];
 % set initial condition
 u0 = [0, Ub / 2, Ub / 2, Ub, 0];
 
 % set time span
 t_span = [0, 0.1];
 
 % call the solver
 options = odeset(Mass = M);
 [t, u] = ode23t(dudt, t_span, u0, options);
 
 % display the result
 plot(t, Ue(t), 'bo', t, u(:,5), '.r');
 xlabel('t')
 ylabel('y')
 legend("Input Voltage U_e(t)","Output Voltage U_5(t)",Location="NorthWest");
 title("One Transistor Amplifier DAE Problem Solved by ODE23T");
 saveas(gcf, 'One Transistor Amplifier DAE Problem Solved by ODE23T', 'png')