%-
clear all;clc;close all

tic
figure,hold on,axis equal

set(gca,'visible','off')
set(gcf,'Position',[0 0 1920 1080]);
set(gcf,'color','w');

video           = VideoWriter('spiroAnimation.avi');
video.Quality   = 100;
video.FrameRate = 60;
open(video);

n_turns       = 2;
paths_weights = 1.5;
points_weight = 100;

r3 = 0.2;  c3 = 'r';  l3 = 1.5; % exterior
r2 = 0.3;  c2 = 'g';  l2 = 1.5; % media
r1 = 0.4;  c1 = 'b';  l1 = 1.5; % interna

ntheta    = 360;
theta     = linspace(0,360*n_turns,ntheta);

t1 = [0 120 240];
t2 = [240 0 120];
t3 = [120 240 0];

n1     = 5 * n_turns*360;
theta1 = [linspace(t1(1),t1(1)+n1,ntheta)' linspace(t1(2),t1(2)+n1,ntheta)' linspace(t1(3),t1(3)+n1,ntheta)'];

n2     = 9 * n_turns*360;
theta2 = [linspace(t2(1),t2(1)+n2,ntheta)' linspace(t2(2),t2(2)+n2,ntheta)' linspace(t2(3),t2(3)+n2,ntheta)'];

n3     = 11 * n_turns*360;
theta3 = [linspace(t3(1),t3(1)+n3,ntheta)' linspace(t3(2),t3(2)+n3,ntheta)' linspace(t3(3),t3(3)+n3,ntheta)'];

r11 = r1;
r22 = 2*r1+r2;
r33 = 2*r1+2*r2+r3;

thetaS = linspace(0,2*pi*n_turns,ntheta);
n      = 8;
d      = 2;

% Transformacion de la trayectoria de x1,y1 polar-->cartesianas
R1 = r11+r1/d ;
r  = r1/d ;
rt = R1+r*cos(n*thetaS);
x1 = rt.*cos(thetaS);
y1 = rt.*sin(thetaS);

% Transformacion de la trayectoria de x2,y2 polar-->cartesianas
R2 = R1+r1+r2+(r1+r2)/d;
r  = r2/d ;
rt = R2+r*cos(n*thetaS+2*pi/3);
x2 = rt.*cos(thetaS);
y2 = rt.*sin(thetaS);

% Transformacion de la trayectoria de x3,y3 polar-->cartesianas
R3 = R2+r2+r3+(r2+r3)/d;
r  = r3/d ;
rt = R3+r*cos(n*thetaS-2*pi/3);
x3 = rt.*cos(thetaS);
y3 = rt.*sin(thetaS);


% Linea exterior 
Re = R3+r3+r3/d;

% Linea seno
Rs = Re+r3+r3/2;

% Seno Exterior
r   = r3 ;
rt  = Rs+r*cos(n*thetaS);
x41 = rt.*cos(thetaS);
y41 = rt.*sin(thetaS);

r   = r3 ;
rt  = Rs+r*cos(n*thetaS+2*pi/3);
x42 = rt.*cos(thetaS);
y42 = rt.*sin(thetaS);

r   = r3 ;
rt  = Rs+r*cos(n*thetaS-2*pi/3);
x43 = rt.*cos(thetaS);
y43 = rt.*sin(thetaS);

tp = linspace(0,2*pi,360);
plot(R1*cos(tp),R1*sin(tp),'k--','LineWidth',0.5)
plot(R2*cos(tp),R2*sin(tp),'k--','LineWidth',0.5)
plot(R3*cos(tp),R3*sin(tp),'k--','LineWidth',0.5)

plot(x43,y43,'r','LineWidth',paths_weights)
plot(x42,y42,'g','LineWidth',paths_weights)
plot(x41,y41,'b','LineWidth',paths_weights)

len = Rs+r3;
axis([-len len -len len]);

xc = Re*cosd(theta);
yc = Re*sind(theta);
plot(xc,yc,'k','LineWidth',paths_weights);

line1_1 = animatedline('Color',c1,'LineWidth',l1);
line1_2 = animatedline('Color',c1,'LineWidth',l1);
line1_3 = animatedline('Color',c1,'LineWidth',l1);

line2_1 = animatedline('Color',c2,'LineWidth',l2);
line2_2 = animatedline('Color',c2,'LineWidth',l2);
line2_3 = animatedline('Color',c2,'LineWidth',l2);

line3_1 = animatedline('Color',c3,'LineWidth',l3);
line3_2 = animatedline('Color',c3,'LineWidth',l3);
line3_3 = animatedline('Color',c3,'LineWidth',l3);

for i = 1:length(theta)
    
    rc = plot([0 xc(i)],[0 yc(i)],'k--','LineWidth',paths_weights);
    pc = scatter([0 x1(i) x2(i) x3(i) xc(i)],[0 y1(i) y2(i) y3(i) yc(i)],50,'filled','k');
    pr = scatter(x43(i),y43(i),points_weight,'filled','r','MarkerEdgeColor','k');
    pb = scatter(x42(i),y42(i),points_weight,'filled','g','MarkerEdgeColor','k');
    pg = scatter(x41(i),y41(i),points_weight,'filled','b','MarkerEdgeColor','k');

    %c3
    [cx3,cy3,c3] = moving_circles(r3,x3(i),y3(i),'k',paths_weights);
    [r_p3,px,py] = dash_lines(x3(i),y3(i),theta3(i,:),r3,paths_weights,points_weight,'r');

    addpoints(line3_1,px(1),py(1));
    addpoints(line3_2,px(2),py(2));
    addpoints(line3_3,px(3),py(3));

    %c2
    [cx2,cy2,c2]   = moving_circles(r2,x2(i),y2(i),'k',paths_weights);
    [r_p2, px, py] = dash_lines(x2(i),y2(i),theta2(i,:),r2,paths_weights,points_weight,'g');

    addpoints(line2_1,px(1),py(1));
    addpoints(line2_2,px(2),py(2));
    addpoints(line2_3,px(3),py(3));

    %c1
    [cx1,cy1,c1]   = moving_circles(r1,x1(i),y1(i),'k',paths_weights);
    [r_p1, px, py] = dash_lines(x1(i),y1(i),theta1(i,:),r1,paths_weights,points_weight,'b');

    addpoints(line1_1,px(1),py(1));
    addpoints(line1_2,px(2),py(2));
    addpoints(line1_3,px(3),py(3));

    drawnow limitrate
    frame = getframe(gcf);
    writeVideo(video,frame);

    if i< length(theta)
      
       set([pc rc pr pg pb r_p1 r_p2 r_p3 c1 c2 c3],'visible','off')

    end

    
end
 
for i = 1:20
    writeVideo(video,frame);
end

close(video);
toc


