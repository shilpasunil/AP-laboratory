function[cp]= naive_matching(pattern,str)
    cp=0;
    m=length(pattern);
    n=length(str);
    indices=[];//it gives indices at which pattern occures(starting point)
    k=1;
    count=0;//it gives how many time pattern occurs
    for i=1:n-m+1
        for j=1:m
            t=i+j-1;
            cp=cp+1;
           if (pattern(j)  ~= str(i+j-1)) then
              
               break;
           end
           if (j==m) then
               count=count+1;
              indices(k)=i; 
              k=k+1;
           end
        end
    end
    
  return;
endfunction
function [lps,cp] = compute_lps(pattern,m,lps,cp)
    len=1;
    lps(1)=1;
    i=2;
    while( i <m+1)
        cp=cp+1;
        if pattern(i) == pattern(len) then
            len=len+1;
            lps(i)=len;
            i=i+1;
        else
            if len ~= 1 then
                len= lps(len-1);
            else 
                lps(i)=1;
                i=i+1;
            end
        end
    end
                
    
endfunction

function [last]=compute_last(pattern)
   // count=0;
    last=zeros(1,4);
    for i=1:4
        last(i)=-1;    
    end
    for j=length(pattern):-1:1
        //count=count+1; 
        t= pattern(j);
      //  cp=cp+1;
        if last(t) == -1 then
            last(t)=j;
        end
    end
endfunction
     
function[cp]= boyer_moore(pattern,str)
    t=[];
    cp=0;
    k=1;
    m=length(pattern);
    n=length(str); 
    [last]= compute_last(pattern);  
     i=m;
     j=m;
     while (i <=n)
         cp=cp+1;
         if pattern(j) == str(i) then
             if j==1 then
                 t(k)=i;
                 k=k+1;
                 i =i+1+ m;
                j = m;
             else
                 i=i-1;
                 j=j-1;
             end
         else
            i = i + m - min(j, 1 + last(str(i)))+1;
            j=m;
         end
     end
endfunction

function[cp] = kmp_search(pattern,str)
    cp=0;
    n=length(str);
    m=length(pattern);
    lps= zeros(1,m);
   [lps,cp]= compute_lps(pattern,m,lps,cp);
    i=1;
    j=1;
    while(i < n+1)
        cp=cp+1;
        if pattern(j) == str(i) then
            i=i+1;
            j=j+1;
        end
        if j == m+1 then
            //printf("Found pattern at index %d \n", i - j+1); 
            j=lps(j-1);
        elseif i<n+1 && pattern(j) ~= str(i) then
                if j~=1 then
                    j=lps(j-1);
                else
                     i =i+1;
                end
        end
    end
endfunction

function[s]= get_string(n,alpha)
   
    s=zeros(1,n);
    for i =1:n
        s(i)=alpha(grand(1,1,"uin",1,4));
    end
    return
endfunction

alpha= grand(1, "prm", 1:4);    
n=5000;
m=15;
noe = zeros(1,m);
cmp = zeros(1,m);
cmpk = zeros(1,m);
cmpb = zeros(1,m);
//for i =1:t
   
    str = get_string(n,alpha);
    for j= 1:m
         noe(j)=j;
        pattern= get_string(j,alpha);
        [cp]=naive_matching(pattern,str);
        [cpk]=kmp_search(pattern,str);
        [cpb]=boyer_moore(pattern,str)
        cmp(j)=cp;
         cmpk(j)=cpk;
         cmpb(j)=cpb;
    end
    
//end
clf;
plot(noe,cmp,"r");
plot(noe,cmpk);
plot(noe,cmpb,"m");
xgrid(2);
xlabel("PATTERN SIZE(1-15)");
ylabel("NUMBER OF ELEMENT COMPARISON");
title("STRING MATCHING ALGORITHM");
legend("NAIVE ","KMP ","BOYER");
