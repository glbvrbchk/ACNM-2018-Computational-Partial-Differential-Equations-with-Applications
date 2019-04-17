clear all;
k=7:13
n=1;
for i=1:length(k)
    n=2.^k;
    A=rand(n(i),n(i));
    b=rand(n(i),1);
    tic;
    x=A\b; e=toc;
    t(i)=e;
end
loglog(n,t);