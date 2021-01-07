function[index,j] = majority_element(arr,n)
    count=0;
    index = -1;
    j= grand(1,1,"uin",1,n)
        for i= 1:n
           if(i ~= j)
             if arr(j) == arr(i)
                 count = count+1;
             end   
            end 
        end
        if( count > n/2)
            
            index=i;
        end   
endfunction    
