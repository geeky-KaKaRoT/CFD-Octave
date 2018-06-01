clear all
close all
clc

L = 1;
n = 100;
c = 0.1;
dt=1e-2;
x = linspace(0,L,n);
dx = x(2) - x(1);
nt=200;
x_start = 0.1;
x_stop = 0.2;

u = 0.1*ones(1,n);

for i=1:n
  if (x(i)<x_start || x(i)>x_stop)
    continue
  else
    u(i)=0.2;
  endif
endfor
u_old = u;
u_initial = u;

for k = 1:nt
  for i = 2:n
    u(i) = u_old(i) - (c*(dt/dx))*(u_old(i) - u_old(i-1))*(fx);
  endfor
  u_old = u;
  ##plot(x,u_initial)
  ##hold on
  plot(x,u)
  axis([0 1 0 0.2])
  pause(0.03)
endfor

