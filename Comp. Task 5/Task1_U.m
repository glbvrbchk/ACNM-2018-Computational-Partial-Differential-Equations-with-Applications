function U=Task2(N_x,N_t,a,b,A)
exact= @(t,x) u0_2(x-a*t);
T_f=1;
tau=1/N_t; 
h=(b-a)/((N_x+1)); mu=tau/h;
x=a:h:b;
t=0:tau:T_f;


%U^n
%U_0=zeros(N_x+2,1);
%U_0(2:N_x+1)=u0_2(x(2:N_x+1));


ex=zeros(N_x+2,N_t+1);
for m=1:N_x+2
    for p=1:N_t+1
        ex(m,p)=exact(t(p),x(m));
    end
end


U=zeros(N_t+2,N_x+2);
U(1,1:N_x+2)=u0_2(x(1:N_x+2));

%Upwind method
for n=2:N_t+1
    for i=1:N_x+1
        U(n,i)=(1-2*mu)*U(n-1,i)+2*mu*U(n-1,i+1);
    end
end

% Subplot the approximations for n = 25, 50, and 75.
figure
xlabel('x'); title('n=25/t=0.1');
grid on
figure
plot(x,U(51,:),'ko-')
xlabel('x');title('n=50/t=0.2');
grid on
figure
plot(x,U(76,:),'ko-')
xlabel('x'); title('n=75/t=0.3');
grid on
end

