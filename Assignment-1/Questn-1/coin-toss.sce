noe=zeros(1,500);
p=zeros(1,500);
k=1;
for i=10:10:5000
    noe(k)= i;
    trails = round(rand(1,i)*100);
    head=0;
    for j=1:i
        if modulo(trails(j) , 2) == 0
            head=head+1;
        end
    end
    p(k)=head/i;
    k=k+1;
end
plot(noe,p,'k');
xgrid(2);
title("Probability of getting HEAD by tossing a fair coin.");
xlabel("Number of trails");
ylabel("Probability of getting HEAD");
