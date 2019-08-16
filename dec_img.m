function [base_im,detail_im] = dec_img( img,r,eps)

%   recusive filter for the image
[nu_rows,nu_columns,nu_bands]=size(img);
for i=1:nu_bands
     base_im(:,:,i)= RF(img(:,:,i),r,eps,3,img(:,:,i));
     detail_im(:,:,i)=img(:,:,i)-base_im(:,:,i);
end
end

