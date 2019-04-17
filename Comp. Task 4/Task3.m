n=[5,10,20,100,200,400];
u= @(t,x) (exp(-pi^2*t)+sin(t))*sin(pi*x);
f= @(t,x) (cos(t)+pi^2*sin(t))*sin(pi*x);
a=-1; b=1; T_f=1;
Error_IE=zeros(3,1);
Error_CN=zeros(3,1);

for i=1:3
    N_x=39; N_t=20; h=(b-a)/(N_x+1); tau=T_f/N_t;
    x=a:h:b; t=0:tau:T_f;
    U=Task2(N_x,N_t,a,b);
    exact=zeros(N_x+2,1);
    for j=2:N_x+1
        exact(j)=u(t(n(i)+1),x(j));
    end
    Error_CN(i)=max(abs(U(:,n(i)+1)-exact));
end

for i=4:6
    N_x=39; N_t=400; h=(b-a)/(N_x+1); tau=T_f/N_t;
    x=a:h:b; t=0:tau:T_f;
    U=Task1(N_x,N_t,a,b);
    exact=zeros(N_x+2,1);
    for j=2:N_x+1
        exact(j)=u(t(n(i)+1),x(j));
    end
    Error_IE(i-3)=max(abs(U(:,n(i)+1)-exact));
end
    
figure
plot(n(1:3),Error_CN,'o-')
hold on
grid on
plot(n(4:6),Error_IE,'o-')

    