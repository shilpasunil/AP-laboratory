function [dtime,t]=dynamic_binomial(i,k,dtime)
    tic();
    C=zeros(i+1,k+1);
   // C(1,1)=1;
    
    for l=1:i+1
        for j=1:min(l,k)+1
            if (j==l || l==1 ||j==1 )then
              C(l,j) =1;
             
              
            else
                C(l,j)=C(l-1,j-1)+C(l-1,j);
           
            end
        end
    end
    t=C(i+1,k+1);
    dtime = dtime+toc();
endfunction
