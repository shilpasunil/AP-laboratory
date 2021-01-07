k=0;
loop = zeros(1,100000);
value = zeros(1,100000);
for i=1:100000
    loop(i) = i;
    x= rand()*2 ;//x=rand()*(b-a) +a here b=2 and a=0
    y= rand()*2 ;//y= rand()*(d-c) + c here c=0 and d=2
    if y<= sqrt(4-x*x)
        k=k+1;
    end
    value(i) = 2*(2*(k/i));//(d-c)*(b-a)*k/i
  
end
//disp(k);
disp(value(100000));
plot(loop,value,"r");
title("Numerical integration using randomised algorithm");
xlabel("Number of times value is calculated");
ylabel("Value of Integral");
xgrid;
a=gca() ;//get the current axes  
a.box="on";  
a.data_bounds=[0,2.9;100000,3.4];  //define the bounds  
