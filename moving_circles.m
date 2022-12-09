
function [x,y,c] = moving_circles(r,x0,y0,color,line)
         
         % Inputs  :
         %
         % r       : circle radius
         % xo,yo   : circle center
         % color   : circle color
         % line    : circle lineWidth
         %
         % Outputs : 
         % x,y     : circle coordinates
         % c       : circle plot object

         npoints = 32;
         theta   = linspace(0,360, npoints );
         x       = x0 + r*cosd(theta);
         y       = y0 + r*sind(theta);
         c       = plot(x,y,color,'LineWidth',line);
         
end
