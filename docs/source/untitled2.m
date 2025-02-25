% define zfunction
function crtrhy =  CrTrHY(Pr, Tr)

    % define density equation
    function yres = yfunc(y, A, B, C, D, Pr)
         y2 = y * y; y3 = y2 * y; y4 = y3 * y; Den = (1 - y)^3;
         yres = -A * Pr + (y + y2 + y3 - y4) / Den - B * y2 + C * y^D;
    end

    % avoid computing intermediate variables.
    t = 1 / Tr; t2 = t * t; t3 = t2 * t;
    tm1 = 1 - t; tm1e2 = tm1 * tm1;
    A = 0.06125 * t * exp(-1.2 * tm1e2);
    B = 14.76 * t - 9.76 * t2 + 4.58 * t3;
    C = 90.7 * t - 242.2 * t2 + 42.4 * t3;
    D = 2.18 + 2.82 * t; r = A * Pr;
    if(Pr > 15)
        r = r/2;
    end

    % solve the density equation
    y = fsolve(@(y) yfunc(y, A, B, C, D, Pr), r);

    % compute crtr
    y2 = y * y; y3 = y2 * y; y4 = y3 * y; ym1p4 = (1 - y)^4; yDm1 = y^(D - 1);
    Den = (1 + 4 * y + 4 * y2 - 4 * y3 + y4) / ym1p4 - 2 * B * y + C * D * yDm1;
   crtrhy = A*Tr/(y*Den);

end

% set up ressure and temperature mesh
Pr = linspace(0, 25, 501);
Tr = [1.05,  1.1,  1.2,  1.3,  1.4];

% compute z factors and plot them
figure(Color = 'w'); Tlabels = {};
for tr = Tr
    loglog(Pr, arrayfun(@(pr) CrTrHY(pr, tr), Pr)); hold on;
    Tlabels = [Tlabels, "Tr = " + tr];
end

% add legend, axis label and title
legend(Tlabels, location = "southwest");
xlabel("Pr");
axis([0.1, 100, 0.01, 10])
title("Reduced Compressibility Hall Yarborough"); box on;
saveas(gcf, 'Reduced-Compressibility-Hall-Yarborough-Matlab', 'png');