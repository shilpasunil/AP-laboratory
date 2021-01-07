noe=zeros(1,5);
noc=zeros(1,5);
nc=zeros(1,5);
cmp=0;
cp=0;
t=0;
k=1;
for n=10:10:50
    noe(k)=n;
    for z=1:10
    a=round(rand(1,n)*100);
    
   //copy matrix a to b
    b=zeros(1,n);
      for s=1:n
        b(s)=a(s);
      end
      
  //regular bubbleSort  
      for i=1:n
        for j=1:n-i
            cmp=cmp+1;
            if a(j)>a(j+1)
                t=a(j);
                a(j)=a(j+1);
                a(j+1)=t;
            end
        end
      end
  noc(k)=cmp;
  cmp=0;
  
 //modified bubbleSort
 for i=1:n
     flag=0;
     for j=1:n-1
          if b(j) >b(j+1)
               cp=cp+1;
                t=b(j);
                b(j)=b(j+1);
                b(j+1)=t;
                flag=1;
          end
     end
     if flag == 0
         break;
      end
  end
  nc(k)=cp;
  cp=0;
 end
noc(k)=noc(k)/10;
nc(k)=nc(k)/10;
 k=k+1; 
end
plot(noe,noc,'+-+ k');
plot(noe,nc,'*-* r');
xlabel('input element size');
ylabel('no of comparison');
title('Bubble sort performance analysis');
xgrid(2)
legend('BubbleSort','ModifiedBubbleSort',2);
