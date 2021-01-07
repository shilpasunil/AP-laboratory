//function checks for majority element k times 
function [index] = SearchForMajorityElement(arr,k)
    for i=1:k
        index = IndexOfMajority(arr);
        if index ~= -1
            break;
        end
   end
endfunction

//function checks whether a random number is majority element or  not if it is majority element returns its index
function [index] = IndexOfMajority(arr)
    index = -1;
    n = length(arr);
    i = grand("uin",1,n)
    count = 0;
    for j=1:n
        if arr(j) == arr(i)
        count = count + 1;if  n<=1 || n==4 then
        prime =0;
        break;
    else if  n<=
    end
        end
    end
    if count > n/2
        index = i;
    end
endfunction


function [arr] = ArrayGeneration(N,M)
    len = round(N/2) + 1;
    arr = zeros(1,N);
    for i=1:len
        arr(i) = M;
    end
    for i=(len+1):N
        arr(i) = round(rand()*10);
    end
    for i=1:N-len
        j = round(i + (N-i)*rand());
        temp = arr(i);
        arr(i) = arr(j);
        arr(j) = temp;
    end
endfunction


noi = zeros(1,10);
majP = zeros(1,10);
majA = zeros(1,10);
M= round(rand()*10);
N= round(rand()*1000)+1;

for j=1:10
for i=1:10000
    noi(j) =j
    a = ArrayGeneration(N,M);
    index = SearchForMajorityElement(a,j);
    if index ~= -1
        majP(j) = majP(j) + 1;
    else
        majA(j) = majA(j)+1;
    end
end
majP(j) = majP(j)/10000;
majA(j) = majA(j)/10000;
end

plot(noi,majP,"r");
plot(noi,majA);

title('Analysis of Majority element');
xlabel('Number of times randomized counting is performed');
ylabel('Probability of getting majority element');
xgrid(2);
legend('PRESENT','MISSING',1);

