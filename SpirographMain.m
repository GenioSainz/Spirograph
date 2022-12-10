clear all;clc;close all;tic

% moving circles radius
r3 = 7;  
r2 = 6;   
r1 = 5; 

% moving circles speeds
s3 = 13;
s2 = 11;
s1 = 9;

n  = 10;
k  = 0.5;
% n => path xi,yi => number of oscillations
% k => path xi,yi => oscillations amplitude factor
% respect each moving circle radius

% moving circles colors 
c3 = 'r'; 
c2 = 'g';
c1 = 'b';

% xi,yi   => center of the moving circles
%         => cosine oscillations amplitude Ai around Ri
% xci,yci => external cosine waves
%         => cosine oscillations amplitude Ac around Rc
% Re      => exterior radius

% paths and points weights
paths_weights   = 1.5;
points_weight   = 100;

% moving radial axis angles
ntheta  = 360;
n_turns = 1;
theta   = linspace(0,360*n_turns,ntheta);

% phases of the moving points
phase1 = [0 120 240];
phase2 = [240 0 120];
phase3 = [120 240 0];

% speeds(n) and angles(theta) of the moving points
n1     = s1 * 360*n_turns;
theta1 = [linspace(phase1(1),phase1(1)+n1,ntheta)'...
          linspace(phase1(2),phase1(2)+n1,ntheta)'...
          linspace(phase1(3),phase1(3)+n1,ntheta)'];

n2     = s2 * 360*n_turns;
theta2 = [linspace(phase2(1),phase2(1)+n2,ntheta)'...
          linspace(phase2(2),phase2(2)+n2,ntheta)'...
          linspace(phase2(3),phase2(3)+n2,ntheta)'];

n3     = s3 * 360*n_turns;
theta3 = [linspace(phase3(1),phase3(1)+n3,ntheta)'...
          linspace(phase3(2),phase3(2)+n3,ntheta)'...
          linspace(phase3(3),phase3(3)+n3,ntheta)'];

% Path => xi,yi , center of the moving circles
% Path => cosine function  wrapped around a circle wi
% Path => circle radius Ri, cosine amplitude Ai

% Path => x1,y1
A1 = k*r1;
R1 = r1 + A1;
w1 = R1+A1*cosd(n*theta);
x1 = w1.*cosd(theta);
y1 = w1.*sind(theta);

% Path => x2,y2
A2 = k*r2;
R2 = R1+A1+A2+r1+r2;
w2 = R2+A2*cosd(n*theta+120);
x2 = w2.*cosd(theta);
y2 = w2.*sind(theta);

% Path => x3,y3
A3 = k*r3;
R3 = R2+A2+A3+r2+r3;
w3 = R3+A3*cosd(n*theta-120);
x3 = w3.*cosd(theta);
y3 = w3.*sind(theta);

% exterior radius
Re = R3+r3+A3;

% exterior cosines waves wrapped wsi around the circle Rc
% Ac cosine amplitudes 
% paths => xci,yci
Ac = Re/10;
Rc = Re+1.25*Ac;

ws1 = Rc+Ac*cosd(n*theta);
xc1 = ws1.*cosd(theta);
yc1 = ws1.*sind(theta);

ws2 = Rc+Ac*cosd(n*theta+120);
xc2 = ws2.*cosd(theta);
yc2 = ws2.*sind(theta);

ws3 = Rc+Ac*cosd(n*theta-120);
xc3 = ws3.*cosd(theta);
yc3 = ws3.*sind(theta);

% figure settings
figure,hold on,axis equal,grid on;box on
set(gca,'visible','off')
set(gcf,'Position',[0 0 1920 1080]);
set(gcf,'color','w');
axis([-Rc Rc -Rc Rc]+[-1 1 -1 1]*Ac)
% adjust boundig box corners
box_x = [-Rc Rc]+[-1 1]*2*Ac;
box_y = [-Rc Rc]+[-1 1]*2*Ac;
text(box_x,box_y,'.',FontSize=1)

% video settings
% videoName with name k_n_radius_speed r123_r1_r2_r3_s123_s2_s2_s3
videoName       = sprintf('k_%0.2f_n_%0.1f_r123_%0.1f_%0.1f_%0.1f_s123_%0.1f_%0.1f_%0.1f',k,n,r1,r2,r3,s1,s2,s3);
video           = VideoWriter(videoName,'MPEG-4'); 
video.Quality   = 100;
video.FrameRate = 15;
open(video);

%camzoom(1.15)
% plot dash circles R1, R2, R3
plot(R1*cosd(theta),R1*sind(theta),'k--','LineWidth',0.01)
plot(R2*cosd(theta),R2*sind(theta),'k--','LineWidth',0.5)
plot(R3*cosd(theta),R3*sind(theta),'k--','LineWidth',0.5)

% plot circular sine waves
plot(xc3,yc3,'r','LineWidth',paths_weights)
plot(xc2,yc2,'g','LineWidth',paths_weights)
plot(xc1,yc1,'b','LineWidth',paths_weights)

% plot circle under circular sine waves moving radial axis
xc = Re*cosd(theta);
yc = Re*sind(theta);
plot(Re*cosd(theta),Re*sind(theta),'k','LineWidth',paths_weights);

% initialize animated lines
line1_1 = animatedline('Color',c1,'LineWidth',paths_weights);
line1_2 = animatedline('Color',c1,'LineWidth',paths_weights);
line1_3 = animatedline('Color',c1,'LineWidth',paths_weights);

line2_1 = animatedline('Color',c2,'LineWidth',paths_weights);
line2_2 = animatedline('Color',c2,'LineWidth',paths_weights);
line2_3 = animatedline('Color',c2,'LineWidth',paths_weights);

line3_1 = animatedline('Color',c3,'LineWidth',paths_weights);
line3_2 = animatedline('Color',c3,'LineWidth',paths_weights);
line3_3 = animatedline('Color',c3,'LineWidth',paths_weights);

for i = 1:length(theta)
    
    % moving radial axis angle
    t = theta(i);
    
    % moving radial axis
    rc = plot([0 xc(i)],[0 yc(i)],'k--','LineWidth',paths_weights);
    
    % centers =>  0  movingCircle1 movingCircle2 movingCircle3 external
    pc = scatter([0 x1(i) x2(i) x3(i) xc(i)],[0 y1(i) y2(i) y3(i) yc(i)],50,'filled','k');
    
    % point red sine wave
    pr = scatter(xc3(i),yc3(i),points_weight,'filled','r','MarkerEdgeColor','k');

    % point blue sine wave
    pb = scatter(xc2(i),yc2(i),points_weight,'filled','g','MarkerEdgeColor','k');

    % point green sine wave
    pg = scatter(xc1(i),yc1(i),points_weight,'filled','b','MarkerEdgeColor','k');
    
    % update animatedlines and moving circles

    % moving circle3
    [cx3,cy3,c3] = moving_circles(r3,x3(i),y3(i),'k',paths_weights);
    [r_p3,px,py] = dash_lines(x3(i),y3(i),theta3(i,:)+t,r3,paths_weights,points_weight,'r');

    addpoints(line3_1,px(1),py(1));
    addpoints(line3_2,px(2),py(2));
    addpoints(line3_3,px(3),py(3));

    % moving circle 2
    [cx2,cy2,c2]   = moving_circles(r2,x2(i),y2(i),'k',paths_weights);
    [r_p2, px, py] = dash_lines(x2(i),y2(i),theta2(i,:)+t,r2,paths_weights,points_weight,'g');

    addpoints(line2_1,px(1),py(1));
    addpoints(line2_2,px(2),py(2));
    addpoints(line2_3,px(3),py(3));

    % moving circle 1
    [cx1,cy1,c1]   = moving_circles(r1,x1(i),y1(i),'k',paths_weights);
    [r_p1, px, py] = dash_lines(x1(i),y1(i),theta1(i,:)+t,r1,paths_weights,points_weight,'b');

    addpoints(line1_1,px(1),py(1));
    addpoints(line1_2,px(2),py(2));
    addpoints(line1_3,px(3),py(3));

    drawnow limitrate

    % update video
    frame = getframe(gcf);
    writeVideo(video,frame);

    % hide elements 
    if i< length(theta)
 
       set([pc rc pr pg pb r_p1 r_p2 r_p3 c1 c2 c3],'visible','off');

    end
 
end
%export graphic png figure
exportgraphics(gcf,[videoName,'.png'],'Resolution',200)
close(video);
toc


