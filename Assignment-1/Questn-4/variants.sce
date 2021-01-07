k=1;
cp=zeros(1,991);
c=zeros(1,991);
noe=zeros(1,991);
for n=10:1000
    noe(k)=n;
    a=round(rand(1,n)*100);
    
    [cmp_h,ab] = quick(a,1,n,0);   
    [cmp_r,ar] = sorttest_quick(a,1,n,0);
    cp(k) = cmp_r;
    c(k) = cmp_h;
    k=k+1;
end
plot(noe,cp,"m");
plot(noe,c);
xlabel("ARRAY SIZE");
ylabel("NUMBER OF COMPARISON");
title("FOR REVERSE DATA");
xgrid(2);
legend("NORMAL QUICK","HYBRID QUICK",2);
