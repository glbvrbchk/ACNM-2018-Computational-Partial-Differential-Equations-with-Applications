N_x=40; N_t=20; a=-1; b=1;
U=Task1(N_x,N_t,a,b);
n=[5,10,20,100,200,400];
h=(b-a)/((N_x+1)); 
x=a:h:b;
figure
plot(x,U(:,n(4)+1))
hold on 
plot(x,U(:,n(5)+1))
plot(x,U(:,n(6)+1))
grid on
legend('n=100','n=200','n=400')
title('Implicit Euler')
xlabel('x')
ylabel('Approx.')

N_x=40; N_t=20; a=-1; b=1;
U=Task2(N_x,N_t,a,b);
figure
plot(x,U(:,n(1)+1))
hold on 
plot(x,U(:,n(2)+1))
plot(x,U(:,n(3)+1))
grid on
legend('n=5','n=10','n=20')
title('Crank-Nicholson')
xlabel('x')
ylabel('Approx.')
