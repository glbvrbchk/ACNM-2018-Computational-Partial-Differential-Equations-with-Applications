
%function second_central_df (f,x)
f=@(x)cos(pi*x);
x=0.2;
    format long
    for i=2:10
        n(i-1) = 2^i;
        h(i-1) = 1/n(i-1);
    end
    h
%     n=n(2:end)
%     h=1./n
    df_=[]
    dfr_=[]
    errc_=[]
    errr_=[]
    for i=1:length(h)
    df=[1 -2 1]*[f(x+h(i)) f(x) f(x-h(i))]'/h(i)^2;
    dfr=(1/h(i)^2)*(2*f(x)-5*f(x+h(i))+4*f(x+2*h(i))-f(x+3*h(i)));
    df_=[df_;df];
    dfr_=[dfr_;dfr];
    errc=abs(-(pi^2)*cos(pi*x)-df);
    errc_=[errc_;errc]
    errr=abs(-(pi^2)*cos(pi*x)-dfr);
    errr_=[errr_;errr]
    end
    figure();
    loglog(h,errc_,h,errr_);
    %error of first one is bigger
    
%end

