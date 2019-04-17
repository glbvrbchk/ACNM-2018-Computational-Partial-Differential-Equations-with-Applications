function U=Task1(N_x,N_t,a,b)
f= @(t,x) (cos(t)+pi^2*sin(t))*sin(pi*x);
exact= @(t,x) (exp(-(pi^2)*t)+sin(t))*sin(pi*x);
T_f=1;
tau=T_f/N_t; 
h=(b-a)/((N_x+1)); mu=tau/h^2;
x=a:h:b;
t=0:tau:T_f;

%U^n
U_0=zeros(N_x+2,1);
U_0(2:N_x+1)=u0_2(x(2:N_x+1));

%f^n
% make f_ as required with points evaluated at t(n+1)
% to evaluate u(:,n).
f_=zeros(N_x,N_t);
for k=2:N_x+1
    for g=2:N_t+1
        f_(k-1,g-1)=f(t(g),x(k));
    end
end

ex=zeros(N_x+2,N_t+1);
for m=1:N_x+2
    for p=1:N_t+1
        ex(m,p)=exact(t(p),x(m));
    end
end
e=ones(N_x,1);
A=spdiags([-mu*e (1+2*mu)*e -mu*e], -1:1, N_x, N_x);


U=zeros(N_x+2,N_t+1);
U(:,1)=U_0;
for i=1:N_t
    U(2:N_x+1,i+1) = A\(U(2:N_x+1,i)+(tau*f_(:,i)));
end
end

