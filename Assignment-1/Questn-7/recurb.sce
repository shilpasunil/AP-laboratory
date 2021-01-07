s=1;
st =zeros(1,10);
ust = zeros(1,10);
cmp=zeros(1,10);
ucmp=zeros(1,10);

ist =zeros(1,10);
iust = zeros(1,10);
icmp=zeros(1,10);
iucmp=zeros(1,10);

noe =zeros(1,10);
for n=10:10:100
    rec = zeros(1,n);
    noe(s)=n;
    cp=0;
    ucp=0;
    time=0;
    utime=0;
    
    icp=0;
    iucp=0;
    itime=0;
    iutime=0;
    A= round(rand(1,n)*100);
    A=gsort(A,"g","i");
    B= round(rand(1,n+1)*100+100);
        for i=1:n
            k = A(i);
            [cp,index,time]= recursive_binary(A,1,n,k,cp,time);
            [icp,in,itime] = iterative_binary(A,1,n,k,icp,itime);
            
        end
        cmp(s) = cp;
        icmp(s)=icp;
        st(s)=time*1000;
        ist(s)=itime*1000;
        for i=1:n+1
            l=B(i);
            [ucp,index,utime]= recursive_binary(A,1,n,l,ucp,utime);
             [iucp,in,iutime] = iterative_binary(A,1,n,k,iucp,iutime);
            //rec(i)=index;
        end
        iucmp(s)=iucp;
        ucmp(s)=ucp;
        ust(s)=utime*1000;
        iust(s)=iutime*1000;
        s=s+1;
       
        
end
plot(noe,icmp,"m");
plot(noe,iucmp,"k");
xlabel("ARRAY SIZE");
ylabel("NUMBER OF COMPARISONS");
title("ITERATIVE");
xgrid(2);
legend("SUCCESS","UNSUCCESS",2);

