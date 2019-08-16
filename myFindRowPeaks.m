function [pks_pos, locs_pos, pks_neg, locs_neg] = myFindRowPeaks(dat, module_num, module_num_flag)
    dat_mean = mean( dat);
    dat_std = std( dat);
    [pks_pos, locs_pos, w_pos, p_pos] = findpeaks(dat,...
        'NPeaks', module_num(module_num_flag+1),...
        'MinPeakDistance',size(dat,1)/(module_num(module_num_flag+1)*2),...
        'MinPeakHeight', dat_mean + 3*dat_std);
    % figure; plot(im_module_sum_row_diff_lpf); hold on; plot(locs_pos, pks_pos,'O');
    % ����
    % ע����������
    [pks_neg, locs_neg, w_neg, p_neg] = findpeaks(-dat,...
        'NPeaks', module_num(module_num_flag+1),...
        'MinPeakDistance',size(dat,1)/(module_num(module_num_flag+1)*2),...
        'MinPeakHeight', dat_mean + 3*dat_std);
    pks_neg = -pks_neg;
end


% islocalmin


% 2019 08 08 ע��
% %% ���кͷ���������
% % ���
% % ��ֺ󣬴��ڽ����Ե�����
% % ��������ͼ��ƴ������
% % ���ʹ�õ�ͨ�˲���������ʵ�顰��֡��롰��ͨ����˳��Ӱ����
% % �Ҿֲ��ķ�ֵ
% % �����ɰ���ģʽ10����12����
% % ��С����� ͼ���С���԰���������һ��
% % ��С����ֵΪ��ֵ+������׼��
% % �������븺��ֱ���
% % �������ٸ���
% im_module_sum_row_diff = diff(im_module_sum_row);
% im_module_sum_row_diff_lpf = lowpass(im_module_sum_row_diff, 0.01);
% [pks_pos, locs_pos, w_pos, p_pos] = findpeaks(im_module_sum_row_diff_lpf, 'NPeaks', module_num(module_num_flag+1),...
%     'MinPeakDistance',size(im_module,2)/(module_num(module_num_flag+1)*2),...
%     'MinPeakHeight', mean(im_module_sum_row_diff_lpf) + 3*std(im_module_sum_row_diff_lpf));
% % figure; plot(im_module_sum_row_diff_lpf); hold on; plot(locs_pos, pks_pos,'O');
% % ����
% % ע����������
% [pks_neg, locs_neg, w_neg, p_neg] = findpeaks(-im_module_sum_row_diff_lpf, 'NPeaks', module_num(module_num_flag+1),...
%     'MinPeakDistance',size(im_module,2)/(module_num(module_num_flag+1)*2),...
%     'MinPeakHeight', mean(im_module_sum_row_diff_lpf) + 3*std(im_module_sum_row_diff_lpf));
% pks_neg = -pks_neg;
% % figure; plot(im_module_sum_row_diff_lpf); hold on; plot(locs_neg,
% % pks_neg,'X');
% % һ���ͼ
% figure; plot(im_module_sum_row_diff_lpf); 
% hold on; plot(locs_pos, pks_pos,'Marker','O', 'MarkerEdgeColor', 'r', 'MarkerSize', 10);
% hold on; plot(locs_neg, pks_neg,'Marker','O', 'MarkerEdgeColor', 'g', 'MarkerSize', 10);
