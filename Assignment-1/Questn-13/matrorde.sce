function[name] = printPara(i,j,br,name)
    if i==j then
        printf(name);
        t=ascii(name);
        name = char(t+1); 
        return;       
    end
    printf("(");
    [name]=printPara(i,br(i,j),br,name);
    [name]=printPara(br(i,j)+1,j,br,name);
    printf(")");
    
endfunction
function matrixChainOrder(arr,n)
     
   m= zeros(n,n);
   br=zeros(n,n);
   for l=2:n-1
       for i=2:n-l+1
           j=i+l-1;
           m(i,j)=1000000000;//this value is taken as maximum integr value in this program
           for k=i:j-1
               q= m(i,k)+m(k+1,j)+arr(i-1)*arr(k)*arr(j);
               if q<m(i,j) then
                   m(i,j)=q;
                   br(i,j)=k;
               end
            end
         end
       end
       name = char('A');
       printf("\n");
       printf("Optimal Parenthesization is : ");
       printPara(2,n,br,name);
       printf("\nOptimal Cost is :%d\n",m(2,n));
       return;   
endfunction

arr=[12,21,65,18,24,93,121,16,41,31,47,5,47,29,76,18,72,15];
n=length(arr);
matrixChainOrder(arr,n);
