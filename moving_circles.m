
function [x,y,c] = moving_circles(r,x0,y0,color,line)
         
         npoints = 32;
         theta   = linspace(0,360, npoints );
         x       = x0 + r*cosd(theta);
         y       = y0 + r*sind(theta);
         c       = plot(x,y,color,'LineWidth',line);
end