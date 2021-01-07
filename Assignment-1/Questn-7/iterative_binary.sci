function[icp,in,t]=iterative_binary(A,l,h,k,icp,itime)
    tic();
    in=-1;
    while (l<=h)
        icp = icp+1;
        mid=round((l+h)/2);
        if ( A(mid) == k)
            in=mid;
            break;
        end
        if (A(mid) < k)
            l=mid+1;
        else
            h=mid-1;
        end
        
    end
   t=itime+toc();
endfunction
