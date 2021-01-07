function[cmpa]= add(A,B,C,n)
    cmpa=0;
    if n==1 then
        C= A+B;
        cmpa =1;
        return;
    end
    for i=1:n
        for j=1:n
            C(i,j) = A(i,j) + B(i,j);
            cmpa = cmpa+1;
        end
    end
endfunction
