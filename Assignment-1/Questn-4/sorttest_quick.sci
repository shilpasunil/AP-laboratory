function[cmp,a] = sorttest_quick(a,low,high,cmp)
    
    if low < high then
       [pi,cmp,a]= partition(a,low,high,cmp);
        [cmp,a]=sorttest_quick(a,low,pi-1,cmp);
       [cmp,a]= sorttest_quick(a,pi+1,high,cmp);
    end
endfunction
