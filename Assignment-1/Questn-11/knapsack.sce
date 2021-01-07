
function[t_v] = greedy(w,v,c,len,cap)
    t_v=0;
    w_l=cap;
    for i=1:len
        if  w_l >= w(i)then
            t_v= t_v+v(i);
            w_l = w_l- w(i);
            
        end 
        if w_l <=0 then
            break;
        end
    end
   return;
    
endfunction

function[ t ]=dynamic(w,v,len,cap)
    K=zeros(len+1,cap+1);
    for i=1:len+1
        for j=1:cap+1
            if (i == 1 || j ==1 )
                K(i,j) =0;
            elseif ( j-w(i-1) >= 1)
                K(i,j) = max(v(i-1) +K(i-1,j-w(i-1)),K(i-1,j));
            end
        end
    end
   
    t =K(len+1,cap+1);
    return
endfunction

 
w=[1,2,5,6,7];
v=[1,6,18,22,28];
cap =11;
for i=1:5
    c(i)=v(i)/w(i);    
end
c=gsort(c,"g");
w=gsort(w,"g");
v=gsort(v,"g");
printf("Output from greedy %d\n",greedy(w,v,c,5,cap));
printf("Output from dynamic %d\n",dynamic(w,v,5,cap));
