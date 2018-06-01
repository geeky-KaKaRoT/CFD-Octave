#solving ODEs
clear all
close all
clc

#second order  ODE

#function ODE_test= f(t)
# ODE_test
#endfunction

function ydot = f (y, t)
  F=9.81;
  m=1;
  ydot=zeros(2,1);
  ydot(1) = y(2);
  ydot(2)=F/m;

endfunction

y0 = [0;1];

y=lsode ("f", y0, (t = linspace(0,5,10)'));

subplot(1,2,1)
plot(t, y(:,1))
subplot(1,2,2)
plot(t, y(:,2))
