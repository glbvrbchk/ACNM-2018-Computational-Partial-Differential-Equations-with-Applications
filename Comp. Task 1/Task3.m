clear all;
k=7:20
n=1;
for i=1:length(k)
    n=2.^k;
e = ones(n(i),1);
A = spdiags([e -2*e e], -1:1, n(i), n(i));
b=rand(n(i),1);
tic;
x=A\b;
e=toc;
t(i)=e;
end
plot(n,t);
