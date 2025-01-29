% define the function handle
a = 0.25;
dydt = @(t,y) 2*(a - t)*y^2;

% set initial condition
y0 = 15.9;

% call the solver
[T, Y] = ode23(dydt, [0, 1], y0);

% display the result
plot(T, Y, '-o')
xlabel('t')
ylabel('y')
title('Solving-with-Matlab-Ode23')
saveas(gcf, 'Solving-with-Matlab-Ode23', 'png')
