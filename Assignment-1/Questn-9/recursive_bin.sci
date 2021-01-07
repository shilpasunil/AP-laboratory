function[time,C] = recursive_bin(i,k,time)
       tic();
       t1=0;
       t2=0;
       
    if (k==0 || i==k) then
        C=1
        time = time+toc();
        return ;
    elseif (k >i ) then
        C=0;
         time = time+toc();
         return ;
        end
    
   [t1,C1]=recursive_bin(i-1,k,t1);
   [t2,C2]=recursive_bin(i-1,k-1,t2);
   C=C1+C2;
   time = t1+t2+time+toc();
   return;
   
endfunction
