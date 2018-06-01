
function out = sec_order(x,dx)
  analytical_deviation=(x^3*(cos(x))-sin(x)*3*x^2)/x^6;
  #forward_diff=((sin(x+dx)/(x+dx)^3)-(sin(x)/(x)^3))/dx;
  central_diff=((sin(x+dx)/(x+dx)^3)-(sin(x-dx)/(x-dx)^3))/(2*dx);
  out = abs(central_diff-analytical_deviation);
end
clear all 
close all
clc

x=pi/3;
dx = linspace(pi/4,pi/4000,20);

for i = 1:length(dx)
  
  second_order_error(i)=sec_order(x,dx(i));

end