clear all 
close all
clc

function out = num_decretization(x,dx)
  analytical_deviation=(x^3*(cos(x))-sin(x)*3*x^2)/x^6;
  forward_diff=((sin(x+dx)/(x+dx)^3)-(sin(x)/(x)^3))/dx;
  #central_diff=((sin(x+dx)/(x+dx)^3)-(sin(x-dx)/(x-dx)^3))/(2*dx);
  out = abs(forward_diff-analytical_deviation);
end

x=pi/3;
dx = linspace(pi/4,pi/4000,20);

for i = 1:length(dx)
  
  first_order_error(i)=num_decretization(x,dx(i));

end

plot(dx,first_order_error)