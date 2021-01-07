function[arr] =generate_array(m,n)
    arr=zeros(1,n);
    len = round(n/2)+1;
    for i=1:len
        arr(i) = m;
    end
    for j=len+1:n
        arr(j) = round(rand()*10);
    end
   for i=1:n-len
        j = round(i + (n-i)*rand());
        temp = arr(i);
        arr(i) = arr(j);
        arr(j) = temp;
    end
    
 
endfunction

