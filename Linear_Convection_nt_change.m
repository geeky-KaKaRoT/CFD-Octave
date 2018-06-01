clear all
close all
clc

%Inputs
dt=[1e-4, 1e-3, 1e-2, 1e-1];
n = 80;
L=1;
t=0.4;
x=linspace(0,L,n);
dx=x(2)-x(1);
x_start  = 0.1;
x_stop = 0.3;
c=1;
u_final = zeros(length(dt),n);
u_old = zeros(length(dt),n);
u_initial=zeros(length(dt),n);

%for every dt
for j=1:length(dt)
u= ones(1,n);
for i=1:n
  if (x(i)<x_start || x(i)>x_stop)
    continue
  else
    u(i)=2;
  endif
endfor
nt=t/dt(j);
u_old(j,:) = u;
u_initial(j,:) = u;
for k = 1:nt
  for i = 2:(n-1)
    u(i) = u_old(j,i) - (pow2(c)*(dt(j)/pow2(dx)))*(u_old(j,i-1) - 2*(u_old(j,i)) + u_old(j,i+1));
  endfor
  u_old(j,:) = u;
endfor
  u_final(j,:) = u;
endfor


%plots
for i=1:length(dt)
  subplot(1,length(dt),i)
  plot(x,u_initial(i,:),u_final(i,:))
  str = sprintf("Wave equation with %d Timestep",dt(i));
  title(str)
  xlabel("Nodes")
  ylabel("Velocity")
endfor