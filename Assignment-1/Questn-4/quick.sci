function[cmp,a]=quick(a,low,high,cmp)
    //len = length(a);
    if(high-low+1 > 12) then
       if low < high then
          [pi,cmp,a]= hybrid_partition(a,low,high,cmp);
          [cmp,a]= quick(a,low,pi-1,cmp);
          [cmp,a]= quick(a,pi+1,high,cmp);
        end 
    else
        [a,cmp]=sorttest_insertion(a,low,high,cmp);
    end    
endfunction
