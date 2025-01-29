% define the function handle
 dzdt = @(t,z) [z(2); -4*z(1)];
 
 % set initial condition
 z0 = [0, 5];

 % set time span
 t_span = [0, 10];
 
 % call the solver
 [T, Z] = ode45(dzdt, t_span, z0);
 
 % display the result
 plot(T, Z, '-o');
 xlabel('t')
 ylabel('y')
 legend('y_1', 'y_2')
 title('Solving-SHO-with-Matlab-Ode45')
 saveas(gcf, 'Solving-SHO-with-Matlab-Ode45', 'png')