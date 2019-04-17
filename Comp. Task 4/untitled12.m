for j=1:length(n)
    figure();
    subplot();
    u_plot = [0;U(:,n(j));0];
    e_plot = ex(:,n(j));
    plot(x(1:end),u_plot);
    hold on
    plot(x(1:end),e_plot);
    ylim([-1,1]);
    xlim([-1,1]);
    U_(:,i)=u_plot;
end
figure();
%plot([1,2,3],err_CN);
