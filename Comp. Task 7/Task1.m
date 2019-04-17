function U=Task1(N_x,N_t,a,b)

T_f=1; tau=1/(N_t+1);  h=(b-a)/((N_x+2)); mu=tau/(h^2); x=linspace(a,b,N_x+2); t=linspace(a,b,N_t+1);

U=zeros(N_x+2,N_t+1);

U(:,1)=u0(x);%D.C
U(1,:)=0;
U(N_x+2,:)=0;


for i=1:N_t
    A=spdiags([-mu.*(1+U(2:N_x+1,i)) 1+(2*mu.*(1+U(2:N_x+1,i))) -mu.*(1+U(2:N_x+1,i))], -1:1,N_x,N_x);
    B= U(2:N_x+1,i)+tau*((U(2:N_x+1,i).^2));
    U(2:N_x+1,i+1) =A\B;
end

% Subplot the approximations for n = 25, 50,75 and 250.
figure
plot(x,U(:,1),'ko-');
xlabel('x'); ylabel('Approximation'); title('n=25 t=0.1');
grid on
figure
plot(x,U(:,2),'ko-')
xlabel('x'); ylabel('Approximation'); title('n=50 t=0.2');
grid on
figure
plot(x,U(:,5),'ko-');
xlabel('x'); ylabel('Approximation'); title('n=75 t=0.3');
grid on
figure
plot(x,U(:,11),'ko-');
xlabel('x'); ylabel('Approximation'); title('n=100 t=1');
grid on
end

