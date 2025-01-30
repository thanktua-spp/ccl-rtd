% define the function handle
 dqdt = @(t, q) pleiades(t,q);

 % set initial condition
 q0 = [3 3 -1 -3 2 -2 2 ...
       3 -3 2 0 0 -4 4 ...
       0 0 0 0 0 1.75 -1.5 ...
       0 0 0 -1.25 1 0 0]';
 
 % set time span
 t_span = linspace(1,15,200);
 
 % call the solver
 opts = odeset("RelTol",1e-13,"AbsTol",1e-15);
 [t89, q89] = ode89(dqdt, t_span, q0, opts);
 
 % display the result
 plot(q89(:,1:7),q89(:,8:14),'--')
 title('Position of Pleiades Stars, Solved by ODE89')
 xlabel('X Position')
 ylabel('Y Position')
 saveas(gcf, 'Position-of-Pleiades-Stars-Matlab-ODE89', 'png')

 AnimateOrbits(t89,q89);

 function dqdt = pleiades(~,q)
    x = q(1:7);
    y = q(8:14);
    xDist = (x - x.');
    yDist = (y - y.');
    r = (xDist.^2+yDist.^2).^(3/2);
    m = (1:7)';
    dqdt = [q(15:28);
            sum(xDist.*m./r,1,'omitnan').';
            sum(yDist.*m./r,1,'omitnan').'];
 end


 function AnimateOrbits(t,q)
    sz = 15; clrs = 'rkbmcyg';
    for k = 1:length(t)
        plot(q(:,1:7),q(:,8:14),'--'); hold on
        xlim([-20 20]);  ylim([-10 10]);
        arrayfun(@(i) plot(q(k,i), q(k,i+7),'o','MarkerSize',sz,...
                 'MarkerFaceColor',clrs(i)), 1:7);
        hold off
        drawnow
        M(k) = getframe(gca);
        im{k} = frame2im(M(k));
    end
    
    filename = "Position-of-Pleiades-Stars-Matlab-ODE89.gif";
    for idx = 1:length(im)
        [A,map] = rgb2ind(im{idx},256);
        if idx == 1
            imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',0);
        else
            imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',0);
        end
    end
    close all
 end