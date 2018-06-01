#solving ODEs
clear all
close all
clc

#first order  ODE
#y'=t^2

#function ODE_test= f(t)
# ODE_test
#endfunction
function xdot = f (x, t)

  xdot = t^2

endfunction

y0 = [0];

y2=lsode ("f", y0, (t = linspace(0,5,10)'))
plot(t, y2, t, t.^3/3,'*')