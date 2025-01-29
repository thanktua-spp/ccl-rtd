% define the function handle
 f = @(x)[3*x(1) - cos(x(2)*x(2)) - 1/2;
          x(1)^2 - 81*(x(2)+0.1)^2 + sin(x(3)) + 1.06;
          exp(x(1)*x(2)) + 20*x(3) + (10*pi-3)/3];
 
 % set initial guess
 x0 = [0.1; 0.1; -0.1];

 % call the solver
 x = fsolve(f, x0);

 % display the result
 disp(x)