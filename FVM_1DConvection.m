close all
clear all
clc

%Inputs
dt=0.01;
n=100;
L=1;
t=4;
nt=t/dt;
c = 0.1;
x = zeros(n);
u_final = zeros(n);
u_old = zeros(n);
u_initial=zeros(n);

u = ones(1,n);
x = linspace(0,L,n);
dx = x(2) - x(1);
x_start = 0.1;
x_stop = 0.3;
for i=1:n
  if (x(i)<x_start || x(i)>x_stop)
    continue
  else
    u(i)=2;
  endif
endfor
u_old = u;
u_initial = u;

for k = 1:nt
  for i = 2:n-1
    %flux_limiter
    if (u(i)-u(i-1)) == 0
      r = 0;
    else
      r = (u(i+1)-u(i))/(u(i)-u(i-1));
    endif
    if r<=0
      phi = 0;
    elseif r<1
      phi=r;
    else
      phi=1;
    endif
    u(i) = u_old(i) - ((c^2)*(dt/(dx^2)))*(u_old(i) - u_old(i-1))*phi;
  u_old = u;
  ##plot(x,u_initial)
  ##hold on
  ##plot(x,u)
  ##axis([0 1 0 2])
  ##pause(0.01)
  endfor
    u_final = u;
endfor
axis([0 1 0 2])
plot(x,u)
str = sprintf("Wave equation with %d nodes",n(i));
title(str)
xlabel("Nodes")
ylabel("Velocity")