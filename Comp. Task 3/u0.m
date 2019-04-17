function y=u0(x)
for i=1:length(x)
   if x(i)<= 0.5
     y(i)= 2*x(i);
   else
       y(i) = 2- 2*x(i);
   end
end