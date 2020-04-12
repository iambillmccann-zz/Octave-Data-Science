N = 10;
n=0:N;
y = zeros(1,N+1);
y(1) = 0;
for j=1:N
    y(j+1) = y(j) + j;
end
yExact=n.*(n+1)/2;
plot(n,y,'o',n,yExact,'x')
xlabel('n');ylabel('y_n')