function U=Task2(N_x,N_t,a,b)
f= @(t,x) (cos(t)+pi^2*sin(t))*sin(pi*x);
exact= @(t,x) (exp(-pi^2*t)+sin(t))*sin(pi*x);
T_f=1;
h=(b-a)/(N_x+1); tau=T_f/N_t; 
x=a:h:b;
t=0:tau:T_f;

tau=T_f/N_t;
mu=tau/h^2;
%Initialise U (output matrix).
U=zeros(N_x+2,N_t+1);
%U^n
U_0=zeros(N_x+2,1);
U_0(2:N_x+1)=u0_2(x(2:N_x+1));

%f_n1 is the n+1 index one.

f_n1=zeros(N_x,N_t);
for k=2:N_x+1
    for g=2:N_t+1
        f_n1(k-1,g-1)=f(t(g),x(k));
    end
end
%f_n is the n index one.

f_n=zeros(N_x,N_t);
for q=2:N_x+1
    for w=2:N_t+1
        f_n(q-1,w-1)=f(t(w-1),x(q));
    end
end

ex=zeros(N_x+2,N_t+1);
for m=1:N_x+2
    for p=1:N_t+1
        ex(m,p)=exact(t(p),x(m));
    end
end

e=ones(N_x,1);
D=spdiags([-mu*e (2+2*mu)*e -mu*e], -1:1, N_x, N_x);
E=spdiags([mu*e (2-2*mu)*e mu*e], -1:1, N_x, N_x);

% initial conditions.
U(:,1)=U_0;
% boundary conditions already set when initialised.
for i=1:N_t
    U(2:N_x+1,i+1) = D\(E*U(2:N_x+1,i)+tau*((f_n(:,i)+f_n1(:,i))));
end
end

