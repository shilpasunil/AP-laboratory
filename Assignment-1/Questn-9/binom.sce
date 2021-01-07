function [time] = formula_based(i,k,time)
    tic();
    if (k==0 || i==k )then
        res=1;
        time=time+toc();
        return;
    elseif (k<i) then
        num_p=1;
        den_p=1;
        if (i< 2* k) then
            k=i-k;
         for j = 1:k+1
             num_p = num_p * (i+1 -j);
             den_p =den_p *j;
         end
         res =num_p/den_p;
         time=time+toc();
         return;
        end
    end
    res=0;
    time=time+toc();
    return;
endfunction
n=10;
r=100;
s=1;
ft=zeros(1,n)
rt=zeros(1,n);
dt=zeros(1,n)
noe=zeros(1,n);
for i=1:n
    time=0;
    dtime=0;
    ftime=0;
    noe(s)=n;
    for j=1:r
        k=grand(1,1,"uin",0,i);
        [time]= recursive_bin(i,k,time);
        [dtime]=dynamic_binomial(i,k,dtime);
        [ftime]=formula_based(i,k,ftime);
    end
    rt(s)=(time/100);
    dt(s)=(dtime/100);
    ft(s)=ftime/100;
    s=s+1;
end
clf
plot(rt,"k");
plot(dt,"m");
plot(ft,"r")
xlabel("N");
ylabel("TIME TAKEN IN s");
title("VARIANTS OF BINARY SEARCH");
xgrid(2);
legend("RECURSIVE","DYNAMIC","FORMULA")
//y=linspace(-2,)
