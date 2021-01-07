function [a,noc]= sorttest_insertion(a,low,high,noc)
    
    
 
  for i=low:high
    key = a(i);
    j = i-1;
    
    while (j>=1 )
           
        if( a(j) >key)
             noc=noc+1;
        //disp("h");
            a(j+1) = a(j);
             
        end
        j=j-1;
     end
   
     a(j+1) = key;
   end
endfunction
