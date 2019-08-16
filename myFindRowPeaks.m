function [pks_pos, locs_pos, pks_neg, locs_neg] = myFindRowPeaks(dat, module_num, module_num_flag)
    dat_mean = mean( dat);
    dat_std = std( dat);
    [pks_pos, locs_pos, w_pos, p_pos] = findpeaks(dat,...
        'NPeaks', module_num(module_num_flag+1),...
        'MinPeakDistance',size(dat,1)/(module_num(module_num_flag+1)*2),...
        'MinPeakHeight', dat_mean + 3*dat_std);
    % figure; plot(im_module_sum_row_diff_lpf); hold on; plot(locs_pos, pks_pos,'O');
    % 负向
    % 注意两处负号
    [pks_neg, locs_neg, w_neg, p_neg] = findpeaks(-dat,...
        'NPeaks', module_num(module_num_flag+1),...
        'MinPeakDistance',size(dat,1)/(module_num(module_num_flag+1)*2),...
        'MinPeakHeight', dat_mean + 3*dat_std);
    pks_neg = -pks_neg;
end


% islocalmin


% 2019 08 08 注释
% %% 找列和范数的坐标
% % 差分
% % 差分后，存在较明显的跳变
% % 该跳变由图像拼接引起
% % 因此使用低通滤波器，经过实验“差分”与“低通”的顺序不影响结果
% % 找局部的峰值
% % 数量由板子模式10还是12决定
% % 最小间隔是 图像大小除以板子数量的一半
% % 最小的阈值为均值+三倍标准差
% % 分正向与负向分别处理
% % 先正向再负向
% im_module_sum_row_diff = diff(im_module_sum_row);
% im_module_sum_row_diff_lpf = lowpass(im_module_sum_row_diff, 0.01);
% [pks_pos, locs_pos, w_pos, p_pos] = findpeaks(im_module_sum_row_diff_lpf, 'NPeaks', module_num(module_num_flag+1),...
%     'MinPeakDistance',size(im_module,2)/(module_num(module_num_flag+1)*2),...
%     'MinPeakHeight', mean(im_module_sum_row_diff_lpf) + 3*std(im_module_sum_row_diff_lpf));
% % figure; plot(im_module_sum_row_diff_lpf); hold on; plot(locs_pos, pks_pos,'O');
% % 负向
% % 注意两处负号
% [pks_neg, locs_neg, w_neg, p_neg] = findpeaks(-im_module_sum_row_diff_lpf, 'NPeaks', module_num(module_num_flag+1),...
%     'MinPeakDistance',size(im_module,2)/(module_num(module_num_flag+1)*2),...
%     'MinPeakHeight', mean(im_module_sum_row_diff_lpf) + 3*std(im_module_sum_row_diff_lpf));
% pks_neg = -pks_neg;
% % figure; plot(im_module_sum_row_diff_lpf); hold on; plot(locs_neg,
% % pks_neg,'X');
% % 一起绘图
% figure; plot(im_module_sum_row_diff_lpf); 
% hold on; plot(locs_pos, pks_pos,'Marker','O', 'MarkerEdgeColor', 'r', 'MarkerSize', 10);
% hold on; plot(locs_neg, pks_neg,'Marker','O', 'MarkerEdgeColor', 'g', 'MarkerSize', 10);
