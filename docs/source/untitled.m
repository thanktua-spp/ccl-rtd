function [T, Y] = HowarthTransform(M)
    gamma = 1.4; 
    Pr = 0.7; 
    C = Pr*(gamma - 1)*M^2;
    rho = @(h) h^(-1); 
    drhodh = @(h) -1*h^(-2);
    mu = @(h) h^(2/3); 
    dmudh = @(h) (2/3)*h^(-1/3);
    rhomu = @(h)rho(h)*mu(h);
    drhomu = @(h, dh) (rho(h)*dmudh(h) + drhodh(h)*mu(h))*dh;
    function dy = dydt(~, y)
        rhomu_h = rhomu(y(4)); drhomu_h = drhomu(y(4), y(5));
        dy = [y(2); y(3); -(2*drhomu_h + y(1))*y(3)/(2*rhomu_h); y(5);
              -(drhomu_h*y(5) + Pr*y(1)*y(5) + C*rhomu_h*y(3)^2)/rhomu_h];
    end
    
    tspan = [0,5]; 
    T = tspan; 
    Y = tspan;
    
    function res = fun(y35_0)
        y0 = [0, 0, y35_0(1), 2, y35_0(2)];
        [T, Y] = ode45(@dydt, tspan, y0);
        res = Y(end, [2,4])' - 1;
    end
    
    fsolve(@fun, [0.5;1]);
    Y(:,4) = Y(:,4)-1;
end

[T, Y] = HowarthTransform(0); 
figure(color='w'); hold on; 
plot(T, Y(:, 2), 'b', linewidth = 2);
plot(T, Y(:, 4), 'r', linewidth = 2);


[T, Y] = HowarthTransform(5);
plot(T, Y(:, 2), 'b', linewidth = 2);
plot(T, Y(:, 4), 'r', linewidth = 2);
axis([0,5,0,2]); box on;
saveas(gcf, 'Howarth-Transformation-Matlab', 'png')
