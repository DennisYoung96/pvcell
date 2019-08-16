function Std=std(A)
% A=imread('clockNSST2.tif');
A=A.*255;
ss=size(A);
sum=0;
for i=1:ss(1)
    for j=1:ss(2)
        sum=sum+double(A(i,j));
    end
end
mean=sum/(ss(1)*ss(2));
sum2=0;
for i=1:ss(1)
    for j=1:ss(2)
        a=double(A(i,j))-mean;
        sum2=sum2+a^2;
    end
end
Std=sqrt(double(sum2/(ss(1)*ss(2))));