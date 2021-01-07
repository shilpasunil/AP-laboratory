
cmp = zeros(1,7);
cp = zeros(1,7);
noe = zeros(1,7)

for n =1:7
    k=0;
   noe(n) = n;
   t= 2.^n;
   A = zeros(t,t);
   B= zeros(t,t);
   C= zeros(t,t);
   for i = 1:t
       for j= 1:t
         for z= 1:t
             k=k+1;
             C(i,j) = A(i,j)*B(i,j);
          end
       end
   end
   cmp(n)=k/100000;
   cp(n)= strassen_algorithm(A,B,C,t)/100000;
    
end

 
plot(noe,cmp,"r");
plot(noe,cp);
xgrid(2);

title("PERFORMANCE ANALYSIS OF MATRIX MULTIPLICATION");
xlabel("n {MATRIX SIZE: 2^n}");
ylabel("Number of comparisons in 100000");
legend("NAIVE","STRASSEN");

