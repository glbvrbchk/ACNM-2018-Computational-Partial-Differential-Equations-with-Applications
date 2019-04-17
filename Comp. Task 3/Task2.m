f= @(t,x) sin(t+x)
T_f=1;
N_x=19;
N_t=800;
n=[0,1,25,50,100,400,800];
a=0;b=1;
h=(b-a)/((N_x)+1);
x=0:h:1
tau=T_f/N_t;
mu=tau/h^2;
U_0(1)=0;
for i=2:N_x+1
   U_0(i-1)=u0_2(x(i));
end

for k=1:N_x
    for g=1:N_t
        f_(k,g)=f(g,x(k));
    end
end
U_0=U_0';
A=full(gallery('tridiag',N_x,mu,(1-2*mu),mu));

U(:,1)=U_0;
for i=1:N_t
    U(:,i+1) = A*U(:,i)+tau*f_(:,i);
end

for j=1:length(n)
    figure();
    u_plot = [0;U(:,n(j)+1);0];
    plot(x(1:end),u_plot);
end
