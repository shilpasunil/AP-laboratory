function[prime] = isPrime(n)
    prime=1;
    if n<=2 then
        prime = 0;
        return;
    else if pmodulo(n,2) == 0 then
            prime=0;
        end
    end
    t=sqrt(n);
    
    for i=3:2:t
        if pmodulo(n,i) == 0 then
            prime = 0
            return;
        end
    end
endfunction

function [bool] = fermant(n,s)
    if n== 3 then
        bool=1;
        return;
    end
    bool = 1;
    for i=1:s
        a = round(2 + (n-3)* rand());
        if gcd(n,a) ~= 1 then
            bool=0;
            return;
        end
        t= a.^(n-1);
        p = pmodulo(t,n);
        if p ~= 1
             bool = 0;
             break;
        end
    end
    
endfunction

function[prime]=millertest(n,d)
    flag=0;
   
    a = round(rand()*(n-4)+2);
    t= a.^d;
    x= pmodulo(t,n);
    if (x == 1) || (x == (n-1)) then
        prime=1;
        return;
    end
     while d ~= (n-1)
        p=x*x;
        d=d*2;
        x= pmodulo(p,n);
        if x== 1 then
            prime =0;
            return;
        end
        if x== (n-1) then
                prime =1;
                return;
         end
 
    end
    prime=0; 
endfunction


function[prime] = millerRabin(n,k)
    prime=1;
    if n==4 then
        prime=0;
        return;
    end
    if n == 3 then
            prime=1;
            return;
            
    end
    d= n-1;
    while pmodulo(d,2) == 0
         d= d/2;
    end
    for i=1:k
        //prime = millertest(n,d);
        if ( millertest(n,d) == 0)
           
            prime = 0;
            return;
         end
        
    end
endfunction



fmiss =0;
mmiss =0;
fm = zeros(1,1000);
mm = zeros(1,1000);
noe = zeros(1,1000);
i=3;
k=2;
fm(1) =0;
fm(2)=0;
mm(1)=0
mm(2)=0

for j=3:1000
   noe(i)=j;
    //for j=1:i
        correct = isPrime(j);
       
        if millerRabin(j,k)~= correct
            mmiss = mmiss +1;
             if correct == 1 then
                 printf("miller rabin returned %d as not prime but it is prime\n" , j);
             else
                 printf("miller rabin returned %d as prime but it is not prime\n" , j);
             end
             
        end
      if fermant(j,k) ~=correct
          fmiss = fmiss +1;
          if correct == 1 then
                 printf("fermant returned %d as not prime but it is prime\n" , j);
             else
                 printf("fermant returned %d as prime but it is not prime\n" , j);
             end
        end
 fm(i) = fmiss ;
 mm(i)= mmiss;
 i=i+1;  
 
    
end 

plot(noe,fm,"m");
plot(noe,mm,"k");

title("CORRECTNESS OF PRIMALITY TESTING");
xlabel("N");
ylabel("NUMBER OF NUMBERS <= N INCORRECTLY IDENTIFIED");
xgrid;
legend("FERMANT","MILLER-RABIN");
