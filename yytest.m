close all
clear
clc
%% ʹ���ҿ��ķ�ʽ��ͼ����зֿ�

im = imread('cell12.jpg');
% im = imread('cell10.jpg');
% im_module = 256 - im(:,:,1);
% im_module = im_module>150;
im_module = im(:,:,1);
% figure; imshow( im_module); title('ԭʼͼ��');


% ʹ��һά -> �ж�6*10����6*12
im_module_sum_row = mean(im_module, 1); % ���ᣬ�ж�12����10
im_module_sum_col = mean(im_module, 2); % ���ᣬ�̶�Ϊ6
% ʹ��Fourier
% ��10��12���Ӷ�Ӧ��FFT��ֵ��
im_module_sum_row_fft = fft(im_module_sum_row);
% figure, plot( im_module_sum_row); title('���᷽���ֵ');
% figure, stem( abs( im_module_sum_row_fft(2:20))); title('���᷽���ֵ����Ҷ��ֵ��');
% flag -> ������12����10�ı�־ 
% flag -> 1; ���� -> 10
% flag -> 0; ���� -> 12
module_num_flag = abs(im_module_sum_row_fft(10+1)) > abs(im_module_sum_row_fft(12+1)); % +1����Ϊ�����ı��Ϊ1
module_num = [12,10];
% ����̶�Ϊ6�����û�б�Ҫ����ʹ��FFT����
% im_module_sum_col_fft = fft(im_module_sum_col);
% figure, plot( im_module_sum_col);
% figure, stem( abs( im_module_sum_col_fft(2:20)));

%% ���кͷ���������
% ���
% ��ֺ󣬴��ڽ����Ե�����
% ��������ͼ��ƴ������
% ���ʹ�õ�ͨ�˲���������ʵ�顰��֡��롰��ͨ����˳��Ӱ����
% �Ҿֲ��ķ�ֵ
% �����ɰ���ģʽ10����12����
% ��С����� ͼ���С���԰���������һ��
% ��С����ֵΪ��ֵ+������׼��
% �������븺��ֱ���
% �������ٸ���
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

% ��ʼ������
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
%         img_r_lowpass = abs(img_r_lowpass);%����
        r_mean = mean( img_r_lowpass);
        r_std = std( img_r_lowpass);
        [r_pks1, r_locs, w_pos, p_pos] = findpeaks(img_r_lowpass,'NPeaks',2,...
            'MinPeakDistance',size(img_r_lowpass,2)/2, 'MinPeakHeight', r_mean + r_std);
        
        img_c = mean(img, 2);
%         img_c_diff = diff(img_c);
        img_c_lowpass = lowpass(img_c, 0.01);
%         img_c_lowpass = abs(img_c_lowpass);%����
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