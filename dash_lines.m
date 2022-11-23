
function [r_p,px,py] = dash_lines(x0,y0,theta,r,line,points_weight,color)

         px     = x0 + r*cosd(theta);
         py     = y0 + r*sind(theta);
    
         r_p(1) = plot([x0 px(1)],[y0 py(1)],'k--','LineWidth',line);
         r_p(2) = plot([x0 px(2)],[y0 py(2)],'k--','LineWidth',line);
         r_p(3) = plot([x0 px(3)],[y0 py(3)],'k--','LineWidth',line);
         r_p(4) = scatter(px,py,points_weight,'filled',color,'MarkerEdgeColor','k'); 
         
end
