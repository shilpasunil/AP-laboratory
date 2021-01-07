

function [a,noc]= sorttest_selection(a)
    noc=0;
    n=length(a);
  for i=1:n-1
    min_idx =i;
    for j=i+1 :n
        
          if a(j) < a(min_idx)
              noc=noc+1;
              min_idx =j;
          end   
     end
     t=a(min_idx);
     a(min_idx)=a(i);
     a(i)=t;
end
endfunction
