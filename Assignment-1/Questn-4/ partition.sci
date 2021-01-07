function[k,cmp,a]= partition(a,low,high,cmp)
  
    pivot = a(high);
   
    i = low-1;
    for j=low:high-1
             
        if a(j) <=  pivot then
            cmp=cmp+1;
            i=i+1;
            t=a(i);
            a(i)=a(j);
            
            a(j)=t;
            
             
        end
       
    end
    
    p= a(i+1);
    a(i+1) = a(high);
    a(high) = p;
  
    k=i+1;
   
    
endfunction
