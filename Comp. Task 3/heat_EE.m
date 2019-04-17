%task 3
function u = heat_EE (T,a,b,N_t,N_x)
%space grid
h=(b-a)/N_x+2;
x=a:h:b+1;
%time grid
tau=T/N_t;

t=0:tau:N_t+1;

mu=tau/h^2;
u=zeros(N_x+2,N_t+1);%including boundaries
u(:,1)=u0(x);

U=u(:,1);
plot(x,U);

e=ones(N_x,1);
A=spdiags([mu*e -2*e*mu mu*e],[-1,0,1],N_x,N_x)

for n=1:N_t+1
    U(2:N_x+1)=A*U(2:N_x+1);
    U(1)=0; U(N_x+2)=0;
    u(:,n+1)=U;
end
for n=1:10:N_t+1
    plot(x,u(:,n));
    hold on
end
end
%check later