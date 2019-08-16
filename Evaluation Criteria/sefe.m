function delta = sefe( image )
image=image.*255;
%   Separability of Features(delta)
% [m,n,p]=size(image);
% for i=1:p
%     d(:,:,i) = pdist(image(:,:,i));
% end
% z1=d(:,:,1);
% delta1=sum(z1(:))/(m*n);
% z2=d(:,:,2);
% delta2=sum(z2(:))/(m*n);
% z3=d(:,:,3);
% delta3=sum(z3(:))/(m*n);
R=image(:,:,1);
G=image(:,:,2);
B=image(:,:,3);
[L,a,b] = RGB2Lab(R,G,B);
% im(:,:,1)=L;
% im(:,:,2)=a;
% im(:,:,3)=b;
% L=Normalization(L);
% a=Normalization(a);
% b=Normalization(b);
% me=mean(image,3);
im(:,:,1)=L;
im(:,:,2)=a;
im(:,:,3)=b;
me=mean(im,3);
% d=sqrt((L-me).^2+(a-me).^2+(b-me).^2);
d = pdist(me,'euclidean');
d1=norm(d,1);
[m,n]=size(L);
delta=d1/((m-1)*(n-1));
%%
% d1 = pdist(L,'euclidean');
% d1=norm(d1,1);
% [m,n]=size(L);
% delta1=d1/((m)*(n));
% % 
% d2 = pdist(a,'euclidean');
% d2=norm(d2,1);
% [m,n]=size(a);
% delta2=d2/((m)*(n));
% % 
% d3 = pdist(b,'euclidean');
% d3=norm(d3,1);
% [m,n]=size(b);
% delta3=d3/((m)*(n));
% % 
% delta=(delta1+delta2+delta3)/3;
% d=(d1+d2+d3)./3;
% [m,n]=size(L);
% z=norm(d,1);
% delta=z/((m-1)*(n-1));
end

