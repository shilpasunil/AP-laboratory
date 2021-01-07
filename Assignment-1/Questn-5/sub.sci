function[cmpb]= sub(A,B,C,n)
    cmpb=0;
   if n==1 then
        C= A-B;
        cmpb =1;
        return;
    end
    for i=1:n
        for j=1:n
             C(i,j) = A(i,j) - B(i,j);
            cmpb = cmpb+1;
        end
    end
endfunction
