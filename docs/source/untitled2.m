
% define the solution in time space
function wt = EdgeClosedBoundaryRadial_Wd(tD, rD)

   % define the solution in laplace space
   function ws = lapW(s)
      sqrts = sqrt(s); sqrts3 = s * sqrts; rDsqrts = rD * sqrts;
      Num = besseli(1, rDsqrts) * besselk(1, sqrts) - besselk(1, rDsqrts) * besseli(1, sqrts);
      Den = besseli(1, rDsqrts) * besselk(0, sqrts) + besselk(1, rDsqrts) * besseli(0, sqrts);
      if (isinf(Num) || isinf(Den))
         ws = 1 / sqrts3;
      else
         ws = Num / (sqrts3 * Den);
      end
   end

   if(tD == 0 || rD == 1)
      wt =  0;
   else
      wt = niLaplace(@(s)lapW(s), tD);
   end
end

% define the time and radial mesh
Rd = [2, 2.5, 3, 3.5, 4, 50];
Td = logspace(-1, 2);

% compute the water influx and plot
figure(Color='w');
lgd = {};
for rD = Rd
   Wd = arrayfun(@(tD)EdgeClosedBoundaryRadial_Wd(tD, rD), Td);
   semilogx(Td, Wd, linewidth = 2);  hold on;
   lgd = [lgd, "rD = " + num2str(rD)];
end
lgd(end) = 'rD = ∞'; grid on;
xlabel("tD"); ylabel("WD");
legend(lgd, location = "northwest")
axis([0.1, 100, 1, 8]);
title("Dimensionless Water Influx");
saveas(gcf, "Dimensionless-Water-Influx-Matlab-4dn.png");


% define the time and radial mesh
Rd = [5,6,7,8,9,10, 50];
Td = logspace(0, 3);

% compute the water influx and plot
figure(Color='w'); lgd = {};
for rD = Rd
   Wd = arrayfun(@(tD)EdgeClosedBoundaryRadial_Wd(tD, rD), Td);
   semilogx(Td, Wd, linewidth = 2); hold on;
   lgd = [lgd, "rD = " + num2str(rD)];
end
lgd(end) = 'rD = ∞'; grid on;
xlabel("tD"); ylabel("WD");
legend(lgd, location = "northwest")
axis([1,1000,0, 70]);
title("Dimensionless Water Influx");
saveas(gcf, "Dimensionless-Water-Influx-Matlab-5up.png");