function [a,cp]= sorttest_bubble(a)
    cp=0;
    n=length(a);
   for i=1:n
    flag=0;-1     
     for j=1:n-1
             cp=cp+1;
          if a(j) > a(j+1)
            
                t=a(j);
                a(j)=a(j+1);
                a(j+1)=t;
                flag=1;
          end
     end
     if flag == 0
         break;
      end
  end     
endfunction
