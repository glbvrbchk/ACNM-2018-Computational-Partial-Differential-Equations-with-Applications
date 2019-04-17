
%function second_central_df (f,x)
f=@(x) -(pi^2)*cos(pi*x);
ff=@(x) -cos(pi*x)-1;

a=0;
b=1;
N=[];
h=[];
format long

cdf=[];
 for i=2:10
        N(i-1) = 2^i;   
 end
 for k=1:length(N)
    h(k)=(b-a)/N(k);
 end
for j=1:length(N)
    F=[];
    FF=[];
    x=linspace(0,1,N(j)+1);
    x_=x(1:end-1);
    for i=1:N(j)
        F(i)=f(x_(i));
    end
    for(i=1:N(j))
         FF(i)=ff(x(i));
    end
F=F';
A=full(gallery('tridiag',N(j),1,-2,1));
A(1:1)=-1;
F(1)=f(a)/2;
F=-(h(j)^2)*F;
U=linsolve(A,F)
FF=FF'
errn(j)=max(abs(FF-U));
end
errn'

figure();
loglog(N,errn)

