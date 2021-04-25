clear;
i=0;
j=1;
A=[];
while(i<44)
    i = i+2;
    A(j,1) = i;
    A(j,2) = 0;
    A(j,3) = 0.1;
    i = i+0.217;
    j=j+1;
end
point = A(:,1);
value = A(:,2);
err = A(:,3);

A = table(point,value,err);