clear all;
N = 10;
N2 = N^2;
h = 1/(N+1);
x_with_boundary = linspace(0,1,N+2)';
x = x_with_boundary(2:N+1);
[xx,yy] = meshgrid(x,x);
e = ones(N,1);
B = spdiags([e -4*e e], -1:1, N, N);
I = speye(N,N);
A = [B I zeros(N,N2-2*N)];
for i = 1:N-2
A = [A; zeros(N,(i-1)*N) I B I zeros(N,N2 - (2+i)*N)];
end
A = [A; zeros(N,N2-2*N) I B];
F = h^2.* Z(xx,yy);
F = reshape(F,N2,1);
U = A\F ;
U_mat = reshape(U,N,N);
surf (xx,yy,U_mat);
title('Approximation using the five-point scheme')


%(a) For what reason is the variable N2 introduced? (Clearly, we could have just used N^2 wherever needed instead.)
%N is reducing computational cost. There is no point to calculate it every
%time in the code.

%(b) Is A a sparse matrix or a full matrix? Why?
%A matrix is the diagonal matrix that have matrix B on every diagonal
%entry. Matrix B is the sparce diagonal matrix that have ones on lower and
%upper diagonal and -4 on upper diagonal.

%(c) Why does the approximate solution not appear to be zero at the boundary? Try increasing N to N = 100.
%What do you observe happening near the boundary? Explain.





clear all;

a=1;b=-1/4;c=2;

N = 10;
N2 = N^2;
h = 1/(N+1);
x_with_boundary = linspace(0,1,N+2)';
x = x_with_boundary(2:N+1);
[xx,yy] = meshgrid(x,x);
e = ones(N,1);

B = spdiags([a.*e -2*(a+c).*e a.*e], -1:1, N, N);
C = spdiags([b/2.*e c.*e -b/2.*e], -1:1, N, N);
D = spdiags([-(b/2).*e c.*e b/2.*e], -1:1, N, N);
I = speye(N,N);
A=[B D zeros(N,N2-2*N)]
for i = 1:N-2
    A = [A; zeros(N,(i-1)*N) C B D zeros(N,N2 - (2+i)*N)];
end
A = [A; zeros(N,N2-2*N) C B];
F = h^2.* Z(xx,yy);
F = reshape(F,N2,1);
U = A\F ;
U_mat = reshape(U,N,N);
surf (xx,yy,U_mat);
title('New Approximation')

