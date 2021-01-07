
function[c,i,t] = recursive_binary(a,l,h,k,c,time)
  tic();
   mid=round((l+h)/2);
   i=-1;
    c=c+1;
   if l<=h then
      if k== a(mid) then
         
          i=mid
          break;
   
      elseif k<a(mid)
               
                [c,i]=recursive_binary(a,l,mid-1,k,c);
           else
                
                [c,i]=recursive_binary(a,mid+1,h,k,c);
            end
  end
    t=time+toc();
endfunction
