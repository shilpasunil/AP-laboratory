function[A,index,cp] = partition(A,l,r,c)
    cp=c;
    x= A(r);
    i=1;
    for j=1:r-1
        if A(j) >=x then
            cp=cp+1;
            t= A(i);
            A(i)=A(j)
            A(j)=t;
            i=i+1;
        end
    end
    t=A(i);
    A(i)=A(r);
    A(r)=t;
    index =i;
endfunction

function[A,index,cp] = kthsmall(A,l,r,k,c)
    cp=c;
    if (k>0 && k<= r-l+1) then
         [A,index,cp] = partition(A,l,r,cp);
         if( index-l == k -1)then
             return;
         end
         if  (index -l > k-1) then
             cp=cp+1;
            [A,index,cp]=  kthsmall(A,l,index-1,k,cp);
        end
    
      [A,index,cp] = kthsmall(A,index+1,r,k-index+l-1,cp);
    end
endfunction
noe = zeros(1,450);
cmp = zeros(1,450);
c=0;
i=1;
for n= 50:500
    noe(i) =n;
    A= round(rand(1,n)*100);
    l=1;
    r=n;
    k=3;
   [A,index,cp] = kthsmall(A,l,r,k,c);
   cmp(i) =cp;
   i=i+1;
end   

plot(noe,cmp,"m");
xgrid;
title("FINDING 3rd LARGEST ELEMENT USING QUICK SELECT");
xlabel("ARRAY SIZE");
ylabel("NUMBER OF COMPARISON");

