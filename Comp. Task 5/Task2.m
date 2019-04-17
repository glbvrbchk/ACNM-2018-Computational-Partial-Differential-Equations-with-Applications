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


U=zeros(N_t+1,N_x+2); %initialise
U(1,1:N_x+2)=u0_2(x(1:N_x+2)); %boundary 

%Lax-Wendroff method
for n=2:N_t+1
    for i=2:N_x
        U(n,i)=-mu*(1-2*mu)*U(n-1,i-1)+(1-4*mu^2)*U(n-1,i)+mu*(1+2*mu)*U(n-1,i+1);
    end
end
% Subplot the approximations for n = 25, 50, and 75.
figure
sub1=subplot(1,3,1);
plot(x,U(26,:),'ko-')
xlabel('x'); ylabel('approx. of u'); title('n=25/t=0.1');
grid on
sub2=subplot(1,3,2);
plot(x,U(51,:),'ko-')
xlabel('x'); ylabel('approx. of u'); title('n=50/t=0.2');
grid on
sub3=subplot(1,3,3);
plot(x,U(76,:),'ko-')
xlabel('x'); ylabel('approx. of u'); title('n=75/t=0.3');
grid on
linkaxes([sub1,sub2,sub3],'xy')
end

