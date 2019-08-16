
img_lw = lw(:,:,1);
%%
% 
% 

% img_lw = img_lw(:, 50:49+240);
% img_lw = normalMinMax(img_lw);
img_lw_up_1 = impyramid(img_lw, 'expand');
img_lw_up_2 = impyramid(img_lw_up_1, 'expand');
% img_lw_up_3 = impyramid(img_lw_up_2, 'expand');
img_lw_down_1 = impyramid(img_lw, 'reduce');
img_lw_down_2 = impyramid(img_lw_down_1, 'reduce');
% img_lw_down_3 = impyramid(img_lw_down_2, 'reduce');

img_sw = sw(:,:,1);
% img_sw = normalMinMax(img_sw);
% img_sw = histeq(img_sw);
img_sw_down_1 = impyramid(img_sw, 'reduce');
img_sw_down_2 = impyramid(img_sw_down_1, 'reduce');
% img_sw_down_3 = impyramid(img_sw_down_2, 'reduce');


img_sw_up_1 = impyramid(img_sw, 'expand');
img_sw_up_2 = impyramid(img_sw_up_1, 'expand');
img_sw_up_3 = impyramid(img_sw_up_2, 'expand');
% 
% img_e = img_lw;
% sobel_x = [1 2 1; 0 0 0; -1 -2 -1];
% sobel_y = [1 0 -1; 2 0 -2; 1 0 -1];
% img_sobel_x = imfilter(img_e, sobel_x);
% img_sobel_y = imfilter(img_e, sobel_y);
% bw_sobel_x = im2bw(img_sobel_x);
% bw_sobel_y = im2bw(img_sobel_y);