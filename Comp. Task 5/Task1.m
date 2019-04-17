function U=Task1(N_x,N_t,a,b)

T_f=1; tau=1/N_t;  h=(b-a)/((N_x+1)); mu=tau/h; x=a:h:b; t=0:tau:T_f;


U(:,1)=u0(x(2:N_x+1)); %D.C
U(1,:)=0;
U(N_x+2,:)=0;


for i=1:N_t
    A=spdiags([-mu.*(1+U(2:N_x+1,i)) 1+(2*mu.*(1+U(2:N_x+1))) [1;-mu.*(1+u(2:N_x+1,i))]], -1:1,N_x,N_x);
    B= U(2:N_x+1,i);
    U(2:N_x+1,i+1) =A/B;
end

% Subplot the approximations for n = 25, 50, and 75.
figure
plot(x,U(:,11),'ko-');
xlabel('x'); ylabel('Approximation'); title('n=25 t=0.1');
grid on



plot(x,U(:,21),'ko-')
xlabel('x'); ylabel('Approximation'); title('n=50 t=0.2');
grid on

plot(x,U(:,51),'ko-');
xlabel('x'); ylabel('Approximation'); title('n=75 t=0.3');
grid on
end

