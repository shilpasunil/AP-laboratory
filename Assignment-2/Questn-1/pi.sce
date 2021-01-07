k=0;
n=zeros(1,100000);
pi=zeros(1,100000);
for i=1:100000
     n(i)=i;
     x= rand(1,1);
     y=rand(1,1);
     r = sqrt(x*x + y*y);
     if r<=1 
          k=k+1;
     end
     pi(i) = 4*k/i;
     if(pmodulo(i,10000) == 0 && i> 10000)
         printf("%d\t",i);
         printf("%.4f\n",pi(i));
     end
end
printf("Value of pi:\t");
printf("%.4f\n",pi(100000));

plot(pi,"r");

title("Pi using randomized algorithm");
xlabel("Number times pi calculated");
ylabel("Value of pi");
xgrid;
a=gca() ;
 a.box="on";  
  a.data_bounds=[0,2.2;100000,4];  
