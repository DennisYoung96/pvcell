im = imread('NEW_20190530041647__SGzzy____CETCM60510FH382240.jpg');
im = imread('441504I8110005.jpg');
im = im(:,:,1);
im_module = im;
figure; imshow( im_module);

%% 使用傅立叶分析数量
% 使用二维
% 使用加窗傅立叶分解
% myFFT2DLPF(im, dimension, threshold_1, threshold_2)
% im: the input image
% dimension: 1 or 2
% threshold_1: the threshold which orthognal 
% 分解成X 与 Y 两个防方向
threshold_1 = 1;
threshold_2 = 0.99;
im_after_fft_filter(:,:,1) = mat2gray( myFFT2DLPF(im_module, 1, threshold_1, threshold_2));
im_after_fft_filter(:,:,2) = mat2gray( myFFT2DLPF(im_module, 2, threshold_1, threshold_2));
im_after_fft_filter(:,:,3) = min( im_after_fft_filter(:,:,1), im_after_fft_filter(:,:,2));
figure; imshow( im_after_fft_filter(:,:,1))
figure; imshow( im_after_fft_filter(:,:,2))
figure; imshow( im_after_fft_filter(:,:,3))



% 使用一维 -> 判断6*10还是6*12
im_module = im(:,:,1);
im_module_sum_row = mean(im_module, 1);
im_module_sum_col = mean(im_module, 2);
im_module_sum_row_fft = fft(im_module_sum_row);
figure, plot( im_module_sum_row);
figure, stem( abs( im_module_sum_row_fft(2:20)));
im_module_sum_col_fft = fft(im_module_sum_col);
figure, plot( im_module_sum_col);
figure, stem( abs( im_module_sum_col_fft(2:20)));

%% 使用小波分析
[a,h,v,d] = haart2(im_module);
figure; imshow(h{2});
figure; imshow(v{1});
figure; imshow(d{1});

%% 使用递归滤波
r = 100;
eps = 100;
[base_im,detail_im] = dec_img( im_module,r,eps);
figure; imshow(base_im);
figure; imshow(detail_im);


%% 使用LSD算法检测直线段
lines = lsd('441504I8110005.jpg');
imshow(im_module)
hold on;
for i = 1:size(lines, 2)
    plot(lines(1:2, i), lines(3:4, i), 'LineWidth', lines(5, i) / 2, 'Color', [1, 0, 0]);
end

%% 使用Hough Line检测直线段
im_module = im_after_fft_filter(:,:,2);
im_module_edge = edge(im_module, 'canny');
imshow(im_module_edge)
[H,T,R] = hough(im_module_edge);
P  = houghpeaks(H,100,'threshold',ceil(0.3*max(H(:))));
lines = houghlines(im_module_edge,T,R,P,'FillGap',300,'MinLength',400);
figure, imshow(im_module), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

%% 评估
[Result] = Evaluation(im_module)






