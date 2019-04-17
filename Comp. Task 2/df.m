function df (f,x)
    format long
    for n=2:10
        h(n)=2^n
    end
    h=h(2:end)
    df_=[]
    dfr_=[]
    errc_=[]
    errk_=[]
    for i=1:length(h)
    df=[1 -2 1].*[f(x+h(i)) f(x) f(x-h(i))]/h(i)^2;
    dfr=1/h(i)^2*(2*f(x)-5*(x+h(i))+4*f(x+2*h(i))-f(x+3*h(i)));
    df_=[df_;df];
    dfr_=[dfr_;dfr];
    errc=abs(-pi^2*cos(pi*x)-df);
    errc_=[errc_;errc]
    errk=abs(-pi^2*cos(pi*x)-dfr);
    errk_=[errk_;errk]
    end
    figure();
    loglog(errc_,h);
    figure();
    loglog(errk_,h);
end

