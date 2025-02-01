dydt = @(t, y)[y(2); y(3); -0.5*y(3)*y(1)];
tspan = [0,6]; 
function res = fun(y3_0, dydt, tspan)
    y0 = [0, 0, y3_0];
    [~, Y] = ode45(dydt, tspan, y0);
    res = Y(end, 2) - 1;
end
y3_0 = fzero(@(y3_0)fun(y3_0, dydt, tspan), 0.5);
y0 = [0, 0, y3_0];
[T, Y] = ode45(dydt, tspan, y0);
figure(Color = 'w')
plt = plot(T, Y, linewidth = 2);
axis([0,6,0,2])
xlabel("η"); 
title("Blasius Boundary layer");
saveas(gcf, 'Blasius-Boundary-Layer-Matlab', 'png')
