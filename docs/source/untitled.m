         % define zfunction
         function z =  ZfactorHY(Pr, Tr)
         
             % define density equation
             function yres = yfunc(y, A, B, C, D, Pr)
                  y2 = y * y; y3 = y2 * y; y4 = y3 * y; Den = (1 - y)^3;
                  yres = -A * Pr + (y + y2 + y3 - y4) / Den - B * y2 + C * y^D;
             end

             z = 1;
             % avoid computing z when Pr = 0.
             if (Pr ~= 0)
                 t = 1 / Tr; t2 = t * t; t3 = t2 * t;
                 tm1 = 1 - t; tm1e2 = tm1 * tm1;
                 A = 0.06125 * t * exp(-1.2 * tm1e2);
                 B = 14.76 * t - 9.76 * t2 + 4.58 * t3;
                 C = 90.7 * t - 242.2 * t2 + 42.4 * t3;
                 D = 2.18 + 2.82 * t; r = A * Pr;

                 % solve the density equation
                 s = fsolve(@(y) yfunc(y, A, B, C, D, Pr), r);

                 % compute the z factor
                 z = A * Pr / s;
             end
         end

         % set up ressure and temperature mesh
         Pr = (0:300) * 0.05;
         Tr = [1.05,    1.08,   1.12,   1.18,   1.26,   1.35,   1.47, ...
               1.61,    1.75,   1.91,   2.09,   2.29,   2.62,   3.00];
         
         % compute z factors and plot them
         Tlabels = {};
         for tr = Tr
             plot(Pr, arrayfun(@(pr) ZfactorHY(pr, tr), Pr)); hold on;
             Tlabels = [Tlabels, "Tr = " + tr];
         end

         % add legend, axis label and title
         legend(Tlabels, location = "southeast");
         xlabel("Pr"); 
         title("Zfactor Hall Yarborough"); box on;
         saveas(gcf, 'Zfactor-Hall-Yarborough-Matlab', 'png');
