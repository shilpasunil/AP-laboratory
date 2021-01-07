count=0;
s=1;
maj = zeros(1,10);
noe =zeros(1,10);
for k=1:10
    noe(s)=k;
    //for i=1:100
         m= round(rand()*10);
         n= round(rand()*100)+1;
         arr=zeros(1,n);
         arr = generate_array(m,n); 
         for j=1:10 
                count=0;
                [index,y]= majority_element(arr,n);
                if( index == -1)
                    count=count+1;
                else
                    printf("Majority element is %d\n",arr(index));
                end
         end
         maj(s) = count/10;
         non(s) =1 -maj(s);
         printf("%f\t",non(s));
         s=s+1;
   //end
end
//maj(k) = maj(k)/10;
//non()
//printf("%d\t",maj(k));
//disp(non(10));
plot(maj);
title('Analysis of Majority element for N=1000 averaged 100 times')
xlabel('k = Number of times randomized counting is performed')
ylabel('Probability of finding majority element')


 
