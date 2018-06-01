#solving ODEs
clear all
close all
clc

#second order  ODE

#function ODE_test= f(t)
# ODE_test
#endfunction

function ydot = f (y, t)
  g=9.81;
  l=1;
  m=1;
  ydot=zeros(2,1);
  ydot(1) = y(2);
  ydot(2)=-g*(t)/(l*m);

endfunction

y0 = [0;0];

y=lsode ("f", y0, (t = (linspace(pi/4,-pi/4,20)')));


ysin=sin(y(:,1));
xcos=cos(y(:,1));
x_pen = zeros(1,20);
y_pen = zeros(1,20);
for i=1:20
  y_pen(i) = ysin(i);
  x_pen(i) = xcos(i);
end
for i=1:5
for j=1:20
  plot([0,x_pen(j)],[0,y_pen(j)])
  axis([-2 2 -2 2])
  pause(0.03)
end
x_pen=-x_pen;
end

%subplot(1,2,1)
%plot(t, sin(y(:,1)))
%axis([-1 1 -1 1])
%subplot(1,2,2)
%plot(t, y(:,2))
%%axis([-1 1 -1 1])