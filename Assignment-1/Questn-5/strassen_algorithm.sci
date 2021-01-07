function[cmp]=strassen_algorithm(A,B,C,n)
     
    if n == 1 then
        cmp=1;
        return;
    else
        n = n/2;
        a11 = zeros(n,n);
        a12 = zeros(n,n);
        a21 = zeros(n,n);
        a22 = zeros(n,n);
        
        b11 = zeros(n,n);
        b12 = zeros(n,n);
        b21 = zeros(n,n);
        b22 = zeros(n,n);
        
        p=  zeros(n,n);
        q= zeros(n,n);
        r= zeros(n,n);
        s= zeros(n,n);
        t=  zeros(n,n);
        u=  zeros(n,n);
        v=  zeros(n,n);
        
        c11 = zeros(n,n);
        c12 =  zeros(n,n);
        c21 = zeros(n,n);
        c22 =  zeros(n,n);
        
        ares =  zeros(n,n);
        bres =  zeros(n,n);
        
    end
        for i=1:n
            for j=1:n
                a11(i,j) = A(i,j);
                a12(i,j) = A(i,j + n);
                a21(i,j) = A(i + n,j);
                a22(i,j) = A(i + n,j + n);

                b11(i,j) = B(i,j);
                b12(i,j) = B(i,j + n);
                b21(i,j) = B(i + n,j);
                b22(i,j) = B(i + n,j + n);
               
              end

        end
        cmpa1 = add(a11,a22,ares,n);
        c= add(b11,b22,bres,n);
        cmpm1 = strassen_algorithm(ares,bres,p,n);
        
        cmpa2 = add(a21,a22,ares,n);
        cmpm2 = strassen_algorithm(ares,b11,q,n);
        
        cmpb1 = sub(b12,b22,bres,n);
        cmpm3 = strassen_algorithm(a11,bres,r,n);
        
        cmpb2 = sub(b21,b11,bres,n);
        cmpm4 = strassen_algorithm(a22,bres,s,n);
        
        cmpa3 = add(a11,a12,ares,n);
        cmpm5 = strassen_algorithm(ares,b22,t,n);
        
        cmpb3 = sub(a21,a11,ares,n);
        cmpa4 = add(b11,b12,bres,n);
        cmpm6 = strassen_algorithm(ares,bres,u,n);
        
        cmpb4 = sub(a12,a22,ares,n);
        cmpa5 = add(b21,b22,bres,n);
        cmpm7 = strassen_algorithm(ares,bres,v,n);
        
        cmpa=cmpa1+cmpa2+cmpa3+cmpa4+cmpa5+c;
        cmpb = cmpb1+cmpb2+cmpb3+cmpb4;
        cmpm = cmpm1+cmpm2+cmpm3+cmpm4+cmpm5+cmpm6+cmpm7;
        
        cmp=cmpa+cmpm+cmpb;
    
  
    
   
    
  
    
    
endfunction
