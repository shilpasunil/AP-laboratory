function[t,res]= dynamic(arr,n)
    tic();
   m= zeros(n,n);
   for l=2:n-1
       for i=2:n-l+1
           j=i+l-1;
           if j == n+1 then
               continue;
           end
           m(i,j)=1000000000;//this value is taken as maximum integr value in this program
           for k=i:j-1
               q= m(i,k)+m(k+1,j)+arr(i-1)*arr(k)*arr(j);
               if q<m(i,j) then
                   m(i,j)=q;
               end
            end
         end
       end
       res=m(2,n);
       t=toc();
       return;   
endfunction
function[time,t] = memoised(arr,i,j,dp)
   tic();
    if i==j then
        t=0;
        return;
    end
    if dp(i,j) ~=0 then
        t=dp(i,j);
        return;
    end
    dp(i,j)=10000000;
    for k=i:j-1
        [t1 ,res1]=memoised(arr,i,k,dp);
        [t2,res2]= memoised(arr,k+1,j,dp);
        dp(i,j)=min(dp(i,j), res1 +res2 + arr(i-1)*arr(k)*arr(j));
    end
    t=dp(i,j);
    time=t1+t2+toc();
    return;
endfunction
arr =[40, 20, 30, 10, 30];
ti=zeros(1,100);
tim=zeros(1,100);
n=length(arr);
dp=zeros(n,n);
for i=1:100
    
    [mtime,t2]= memoised(arr,2,n,dp);
    
    [time,t1]=dynamic(arr,n);
   
    ti(i)=time ;
    tim(i)=mtime;
end
clf;
printf("Minimum number of multiplications using tabulation method is %d \n",t1);
printf("Minimum number of multiplications using memoisation method is %d ",t2);
plot(ti,"m");
plot(tim,"k");
xlabel("NUMBER OF TIMES ALGORITHM IS EXECUTED");
ylabel("TIME TAKEN IN ns");
title("MATRIX CHAIN MULTIPLICATION");
xgrid(2);
legend("TABULATION","MEMOISED");

