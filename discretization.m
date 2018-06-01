clear all
close all
clc

%inputs
x=pi/3;
dx=pi/400;

%analytical_deviation
analytical_deviation=(x^3*(cos(x))-sin(x)*3*x^2)/x^6;

%first_order_approximation
first_order=((sin(x+dx)/(x+dx)^3)-(sin(x)/(x)^3))/dx;
%second_order_approximation
second_order=((sin(x+dx)/(x+dx)^3)-(sin(x-dx)/(x-dx)^3))/(2*dx);
%forth_order_approximation
forth_order=((sin(x-(2*dx))/(x-(2*dx))^3)-(8*(sin(x-dx)/(x-dx)^3))+(8*(sin(x+dx)/(x+dx)^3))-(sin(x+(2*dx))/(x+(2*dx))^3))/(12*dx);

%error_calcuation
error_first=abs(first_order-analytical_deviation)
error_second=abs(second_order-analytical_deviation)
error_forth=abs(forth_order-analytical_deviation)


order_x=[1,2,4]
error_y=[error_first,error_second,error_forth]

%bar_graph
bar(order_x,error_y)
title("Error Approximation vs Order")
xlabel("Order of Approximation")
ylabel("Error Value")