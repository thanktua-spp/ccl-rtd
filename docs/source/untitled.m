            Rd = [2, 4, 6, 8, 10];
            Td = logspace(-2, 4);
            for rD = Rd 
               Wd = arrayfun(@(tD)EdgeClosedBoundaryRadial_Wd(tD, rD), Td);
               semilogx(Td, Wd, linewidth = 2); hold on;
            end
            grid on;
            xlabel("tD");
            ylabel("WD");
            legend("rD = 2", "rD = 4", "rD = 6", "rD = 8", "rD = 10", location = "northwest")
            
            title("Dimensionless Water Influx");
            saveas(gcf, "Dimensionless-Water-Influx-Matlab.png");
            
            function ws = lapW(s, rD)
               sqrts = sqrt(s); sqrts3 = s * sqrts; rDsqrts = rD * sqrts;
               Num = besseli(1, rDsqrts) * besselk(1, sqrts) - besselk(1, rDsqrts) * besseli(1, sqrts);
               Den = besseli(1, rDsqrts) * besselk(0, sqrts) + besselk(1, rDsqrts) * besseli(0, sqrts);
               if (isinf(Num) || isinf(Den))
                   ws = 1 / sqrts3;
               else
                   ws = Num / (sqrts3 * Den);
               end
            end
            
            function wt = EdgeClosedBoundaryRadial_Wd(tD, rD)
               if(tD == 0 || rD == 1)
                  wt =  0;
               else
                  wt = niLaplace(@(s)lapW(s, rD), tD);
               end
            end