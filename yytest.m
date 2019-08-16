close all
clear
clc
%% 使用找框框的方式对图像进行分块

im = imread('cell12.jpg');
% im = imread('cell10.jpg');
% im_module = 256 - im(:,:,1);
% im_module = im_module>150;
im_module = im(:,:,1);
% figure; imshow( im_module); title('原始图像');


% 使用一维 -> 判断6*10还是6*12
im_module_sum_row = mean(im_module, 1); % 长轴，判断12还是10
im_module_sum_col = mean(im_module, 2); % 短轴，固定为6
% 使用Fourier
% 看10与12板子对应的FFT幅值谱
im_module_sum_row_fft = fft(im_module_sum_row);
% figure, plot( im_module_sum_row); title('长轴方向均值');
% figure, stem( abs( im_module_sum_row_fft(2:20))); title('长轴方向均值傅立叶幅值谱');
% flag -> 长轴是12还是10的标志 
% flag -> 1; 长轴 -> 10
% flag -> 0; 长轴 -> 12
module_num_flag = abs(im_module_sum_row_fft(10+1)) > abs(im_module_sum_row_fft(12+1)); % +1是因为常量的标号为1
module_num = [12,10];
% 短轴固定为6，因此没有必要对其使用FFT讨论
% im_module_sum_col_fft = fft(im_module_sum_col);
% figure, plot( im_module_sum_col);
% figure, stem( abs( im_module_sum_col_fft(2:20)));

%% 找列和范数的坐标
% 差分
% 差分后，存在较明显的跳变
% 该跳变由图像拼接引起
% 因此使用低通滤波器，经过实验“差分”与“低通”的顺序不影响结果
% 找局部的峰值
% 数量由板子模式10还是12决定
% 最小间隔是 图像大小除以板子数量的一半
% 最小的阈值为均值+三倍标准差
% 分正向与负向分别处理
% 先正向再负向
im_module_sum_row_diff = diff(im_module_sum_row);
im_module_sum_row_diff_lpf = lowpass(im_module_sum_row_diff, 0.01);
[row_pks_pos, row_locs_pos, row_pks_neg, row_locs_neg] = myFindRowPeaks(im_module_sum_row_diff_lpf, module_num, module_num_flag);
% figure; plot(im_module_sum_row_diff_lpf); 
% hold on; plot(row_locs_pos, row_pks_pos,'Marker','O', 'MarkerEdgeColor', 'r', 'MarkerSize', 10);
% hold on; plot(row_locs_neg, row_pks_neg,'Marker','O', 'MarkerEdgeColor', 'g', 'MarkerSize', 10);


im_module_sum_col_diff = diff(im_module_sum_col);
im_module_sum_col_diff_lpf = lowpass(im_module_sum_col_diff, 0.01);
[col_pks_pos, col_locs_pos, col_pks_neg, col_locs_neg] = myFindColPeaks(im_module_sum_col_diff_lpf);
if length(col_pks_neg)~= module_num(module_num_flag+1)/2 || length(col_pks_pos)~= module_num(module_num_flag+1)/2  
    im_module_sum_col_diff_lpf = lowpass(im_module_sum_col_diff, 0.05);
    [col_pks_pos, col_locs_pos, col_pks_neg, col_locs_neg] = myFindColPeaks(im_module_sum_col_diff_lpf);
end
% figure; plot(im_module_sum_col_diff_lpf); 
% hold on; plot(col_locs_pos, col_pks_pos,'Marker','O', 'MarkerEdgeColor', 'r', 'MarkerSize', 10);
% hold on; plot(col_locs_neg, col_pks_neg,'Marker','O', 'MarkerEdgeColor', 'g', 'MarkerSize', 10);

% 开始迭代找
tuozhan = 10;
cp = col_locs_pos;
cp(length(col_locs_pos)+1) = col_locs_neg(end)+tuozhan;
cn = cp(1)-tuozhan;
cn(2:length(col_locs_neg)+1) = col_locs_neg(:);

rp = row_locs_pos;
rp(length(row_locs_pos)+1) = row_locs_neg(end)+tuozhan;
rn = rp(1)-tuozhan;
rn(2:length(row_locs_neg)+1) = row_locs_neg(:);
count = 1;
for i=1:(length(cp)-1)
    for j = 1:(length(rp)-1)
        c_up = min(cp(i),cn(i));
        c_bottom = max(cp(i+1),cn(i+1));
        r_left = min(rp(j),rn(j));
        r_right = max(rp(j+1),rn(j+1));
        img_all = im(c_up:c_bottom,r_left:r_right,:);
        img = 256 - img_all(:,:,1);
        
        img_r = mean(img, 1); 
%         img_r_diff = diff(img_r);
        img_r_lowpass = lowpass(img_r, 0.05);
%         img_r_lowpass = abs(img_r_lowpass);%试验
        r_mean = mean( img_r_lowpass);
        r_std = std( img_r_lowpass);
        [r_pks1, r_locs, w_pos, p_pos] = findpeaks(img_r_lowpass,'NPeaks',2,...
            'MinPeakDistance',size(img_r_lowpass,2)/2, 'MinPeakHeight', r_mean + r_std);
        
        img_c = mean(img, 2);
%         img_c_diff = diff(img_c);
        img_c_lowpass = lowpass(img_c, 0.01);
%         img_c_lowpass = abs(img_c_lowpass);%试验
        c_mean = mean( img_c_lowpass);
        c_std = std( img_c_lowpass);
        [c_pks1, c_locs, w_pos, p_pos] = findpeaks(img_c_lowpass,'NPeaks', 7,...
            'MinPeakDistance',size(img_c_lowpass,1)/6, 'MinPeakHeight', c_mean + c_std);
        c1 = min(c_locs);c2=max(c_locs);
        pvcell{count} = img_all(c1:c2,r_locs(1):r_locs(2),:);
        count = count + 1;
    end
end
figure(3),
for i = 1:(count-1)
    imshow(pvcell{i});
    pause(0.1);
end

% cn = cn.';
% c(:) = round((cn(:)+cp(:))/2);
% rn = rn.';
% r(:) = round((rn(:)+rp(:))/2);
% flag =1;
% for i = 1:(length(c)-1)
%     for j = 1:(length(r)-1)
%         pvcell2{flag} = im(c(i):c(i+1),r(j):r(j+1),:);
%         flag = flag +1;
%     end
% end
% figure(4),
% for i = 1:(count-1)
%     imshow(pvcell2{i});
%     pause(0.1);
% end