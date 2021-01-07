k=1;
noe = zeros(1,12);
noc_r=zeros(1,12);
noc_f=zeros(1,12);
noc_a=zeros(1,5);
noc_d=zeros(1,5);
noc_s = zeros(1,5);

nocs_r=zeros(1,12);
nocs_f=zeros(1,5);
nocs_a=zeros(1,5);
nocs_d=zeros(1,5);
nocs_s=zeros(1,5);

nocb_r=zeros(1,12);
nocb_f=zeros(1,50);
nocb_a=zeros(1,50);
nocb_d=zeros(1,50);
nocb_s=zeros(1,50);

nocq_r=zeros(1,12)
//random number
for n=1:12
    noe(k)=n;
  //for z=1:10
     h=round(rand(1,n)*100);
     b=zeros(1,n);
     c=zeros(1,n);
   
     [ arr_i, noc_r(k) ]=sorttest_insertion(h);
     [ arr_i, nocs_r(k) ]=sorttest_selection(h);
     [ arr_i, nocb_r(k) ]=sorttest_bubble(h);
     [nocq_r(k) ,arr_i] =sorttest_quick(h,1,n,0);
     //sorted data
   
     //reversed ordered data
     
    
     //disp(b);
    //almost sorted
   
     
  
   //highly repeatative
   
   



k=k+1;
end
/*
subplot(221)
plot(noe,noc_r,"b" , noe,noc_a,"y");

plot(noe,noc_f,"g",noe,noc_d,"r")
//plot(noe,noc_s,"m");
xlabel('input element size');
ylabel('no of comparison');
title('Insertion sort performance analysis');
xgrid(2)
legend('Random Data','Almost sorted', 'Reverse Order' ,'Highly repetitive', 2);
subplot(222)
plot(noe,nocs_r,"b" , noe,nocs_a,"y");

plot(noe,nocs_f,"g",noe,nocs_d,"r")
//plot(noe,nocs_s,"m");
xlabel('input element size');
ylabel('no of comparison');
title('Selection sort performance analysis');
xgrid(2)
legend('Random Data','Almost sorted', 'Reverse Order' ,'Highly repetitive', 2);
subplot(2,2,3)
plot(noe,nocb_r,"b" , noe,nocb_a,"y");

plot(noe,nocb_f,"g",noe,nocb_d,"r")
plot(noe,nocb_s,"m");
xlabel('input element size');
ylabel('no of comparison');
title(' Bubble sort performance analysis');
*/
plot(noe,nocb_r,"g");
plot(noe,noc_r,"b");
plot(noe,nocs_r,"m");
plot(noe,nocq_r,"r");
xlabel('input element size');
ylabel('no of comparison');
title(' RANDOM DATA');
xgrid(2)
legend('BUBBLE','INSERTION', 'SELECTION' ,'QUICK', 2);

