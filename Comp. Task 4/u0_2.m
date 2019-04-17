function y=u0_2(x)
y=zeros(length(x),1);
for i=1:length(x)
     y(i)= sin(pi*x(i));
end
