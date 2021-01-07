
function [c] = connected(X)
c = 0;
i = 1;
j = 2;
a = size(X);
while(j > i)
    if X(i,j) == 0
        j = j + 1;
    else
        X(i,:) = X(i,:) | X(j,:);
        X(:,i) = X(:,i) | X(:,j);
        X(j,:) = [];
        X(:,j) = [];
        a(1) = a(1) - 1;
    end
    if (j > a(1)) & (i < a(1))
        j = i + 2;
        i = i + 1;
        c = 1;
        break
    else
        if i >= a(1)
            i = j;
        end
    end
end
endfunction

function [korif,c]=iscircle(korif,akmi)
g=max(korif)+1;
c=0;
n=length(korif);
if korif(akmi(1))==0 & korif(akmi(2))==0
    korif(akmi(1))=g;
    korif(akmi(2))=g;
elseif korif(akmi(1))==0
    korif(akmi(1))=korif(akmi(2));
elseif korif(akmi(2))==0
    korif(akmi(2))=korif(akmi(1));
elseif korif(akmi(1))==korif(akmi(2))
    c=1;
    return
else
    m=max(korif(akmi(1)),korif(akmi(2)));
    for i=1:n
        if korif(i)==m
           korif(i)=min(korif(akmi(1)),korif(akmi(2)));
       end
   end
end
endfunction 

function A = ascWeightBubb(A,col)
[r c] = size(A);

for i = 1 : r - 1
    d = r + 1 - i;
    for j = 1 : d - 1
        if A(j,col) > A(j + 1,col)
           
            A([j j + 1],:) = A([j + 1 j],:);
        end
    end
end
endfunction

function [w,T] = kruskal(PV)
row = size(PV,1);
X = [];
//create graph's adjacency matrix
for i = 1 : row
    X(PV(i,1),PV(i,2)) = 1;
    X(PV(i,2),PV(i,1)) = 1;
end
n = size(X,1);
//check if graph is connected
con = connected(X);
if con == 1
   error('Graph is not connected');
end
//sort PV by ascending weights order, here bubblesort is used
PV = ascWeightBubb(PV,3);
korif = zeros(1,n);
T = zeros(n);
for i = 1 : row

    akmi = PV(i,[1 2]);
    [korif,c] = iscircle(korif,akmi);
    if c == 1
       PV(i,:) = [0 0 0];
   end
end

w = sum(PV(:,3)');

for i = 1 : row
    if PV(i,[1 2]) ~= [0 0]
        T(PV(i,1),PV(i,2)) = 1;
        T(PV(i,2),PV(i,1)) = 1;
    end
end
endfunction

PV=[1,2, 3; 1,3,5;1,8,8;2,3,3;2,4,2;3,6,3;4,11,8;4,5,1;5,6,3;5,7,2;6,10,4;6,13,8;7,8,2;8,9,1;9,12,3;9,14,2;9,10,3;11,12,1;11,14,3;12,13,4;13,14,2];
 [w T] = kruskal(PV);
 printf("Edges present in minimum spanning tree:\n")
 for i=1:14
     for j=i:14
         if T(i,j) ==1 then
            
             printf("(%d,%d)\n",i,j);
         end
     end
 end
 printf("\n");
 printf("Minimum cost of the spanning tree:%d",w);
