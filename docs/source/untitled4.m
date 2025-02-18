clc; opts = odeset(Stats='on', NormControl='off');
% tic; [T, Y] = ode45(@predator_prey, [0,50], [40, 9], opts); toc;
% % Define the Predator-Prey model
% function dz = predator_prey(~, z)
%     x = z(1); y = z(2);  % Predator and Prey Population
%     alpha = 1.1;         % Growth rate of prey
%     beta  = 0.2;         % Rate of predation
%     gamma = 0.4;         % Death rate of predators
%     delta = 0.1;         % Growth rate of predators based on prey
%     dz = [alpha * x - beta * x * y; delta * x * y - gamma * y];
% end


% a = 0.25; y0 = 15.9;
% dydt=@(t,y) 2 * (a - t) * y * y;
% tic; [T, Y] = ode78(dydt, [0,1], 15.9, opts); toc;
% plot(T, Y, '-o')

weissinger = @(t,y,yp) t*y^2 * yp^3 - y^3 * yp^2 + t*(t^2 + 1)*yp - t^2 * y;
t0 = 1;
y0 = sqrt(3/2);
yp0 = 0;
[y0,yp0] = decic(weissinger,t0,y0,1,yp0,0)
[t,y] = ode15i(weissinger,[1 10],y0,yp0, opts);
ytrue = sqrt(t.^2 + 0.5);
plot(t,y,'*',t,ytrue,'-o')
legend('ode15i', 'exact')