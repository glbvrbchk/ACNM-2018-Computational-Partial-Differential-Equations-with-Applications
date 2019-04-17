clear all;
k=7:22
n=1;
for i=1:length(k)
    n=2.^k;
    e=ones(n(i),1);
    A=diag(-2.*e,0)+diag(e(1:n(i)-1),1)+diag(e(1:n(i)-1),-1);
    b=rand(n(i),1);
    tic;
    x=A\b; e=toc;
    t(i)=e;
end
plot(n,t);
