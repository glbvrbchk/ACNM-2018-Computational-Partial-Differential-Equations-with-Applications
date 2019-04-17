function y=u0_2(x)
y=zeros(length(x),1);
for i=1:length(x)
    if (x(i)>0.8) && (x(i)<0.9)
     y(i)= (10^5)*(0.8-x(i)).^2*(0.9-x(i)).^2;
    else
     y(i)=0;
    end
end
