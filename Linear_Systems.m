clear all
close all
clc
A_initial = [5 1 2; -3 9 4; 1 2 -7];
L = zeros(3,3);
U = zeros(3,3);
D = zeros(3,3);
A = A_initial;
for i=1:3
  D(i,i) = A(i,i);
  for j=1:3
   if j<i
     L(i,j) = A(i,j);
   elseif i<j
     U(i,j) = A(i,j);
   endif   
  end
end
X = zeros(3,1);
B = [10; -14; 33];
eig_values = zeros(1,3);
error = 1;
abs_error = 1e-3;
e = zeros(3,3);
A_old = A;
iter=1;
%QR Method
while error > abs_error
    [Q,R]=qr(A);
    A = R*Q;
    if rem(iter,2)==0
      error = abs(max(max((A - A_old))));
      A_old = A;
    endif
    iter = iter+1;
end
for i=1:3
  eig_values(1,i) = A(i,i);
end

%Jacobian_Iteration
jaco_iter=1;
error = 1;
abs_error = 1e-5;
X_old=X;
P_jaco = inv(D)*(-L-U);
spec_jaco = abs(max((eig(P_jaco))));
while error>abs_error
  X=inv(D)*(B - (L+U)*X);
  error=abs(max(X-X_old));
  X_old = X;
  jaco_iter = jaco_iter + 1;
end
printf("Jacobian Iteration:\n");
printf("Spectral Radius:%f\n",spec_jaco);
printf("No.of Iterations:%f\n",jaco_iter);
X

%Gauss-Seidel_Iteration
X = zeros(3,1);
gauss_iter=1;
error = 1;
abs_error = 1e-5;
X_old=X;
P_gauss = inv(D+L)*(-U);
spec_gauss = abs(max((eig(P_gauss))));
while error>abs_error
  X=inv(D+L)*(B - (U)*X);
  error=abs(max(X-X_old));
  X_old = X;
  gauss_iter = gauss_iter + 1;
end
printf("Gauss-Seidel Iteration:\n");
printf("Spectral Radius:%f\n",spec_gauss);
printf("No.of Iterations:%f\n",gauss_iter);
X

%SOR_Iteration
X = zeros(3,1);
w=1.01;
sor_iter=1;
error = 1;
abs_error = 1e-5;
X_old=X;
P_sor = (inv((w*D+L)))*((1-w)*(-U));
spec_sor = abs(max((eig(P_sor))));
while error>abs_error
  X=(inv((w*D+L)))*(B - ((1-w)*(U))*X);
  error=abs(max(X-X_old));
  X_old = X;
  sor_iter = sor_iter + 1;
end
printf("SOR Iteration:\n");
printf("Spectral Radius:%f\n",spec_sor);
printf("No.of Iterations:%f\n",sor_iter);
X

printf("Original X:")
inv(A_initial)*B