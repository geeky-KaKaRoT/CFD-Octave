clear all
close all
clc

%Length of Pipe
l=10;
%Diameter of Pipe
d=8;
%Wedge Angle(Degree)
theta = 45;

mesh_b = zeros(6,3);
wedge_x = sind(theta/2)*(d/2);
wedge_y = sind(90-(theta/2))*(d/2);

%Front face
mesh_b(2,1) = wedge_x;
mesh_b(2,2) = wedge_y;
mesh_b(3,1) = -wedge_x;
mesh_b(3,2) = wedge_y;
mesh_b(4:6,3) = -l;
mesh_b(5,1) = wedge_x;
mesh_b(5,2) = wedge_y;
mesh_b(6,1) = -wedge_x;
mesh_b(6,2) = wedge_y;

mesh_b
