% dat_lw_reg = getRegDat(PV_SIZE_, dat_lw, accurate_tform_img_lw_to_object)
function dat_reg = getRegDat(PV_SIZE_, dat_raw, tform_raw)
%     dat_raw = dat_lw;
%     PV_SIZE_ = 256;
    % tform_raw = projective2d( t_form_collect(:,:,3));
%     tform_raw = accurate_tform_img_lw_to_object;
    % 512 640 ~
    % 256 320 ~
    [height, width, length] = size(dat_raw);
    % 最大轮廓定义
    % 1 _______ 2
    %   |     | 
    %   |     | 
    % 3 ------- 4
    %     640
    % 因为点在图像内部
    % 所以原来的四个点在warp就有可能成为负数
    p1_reg = abs( [1 1 1] * tform_raw.T);
    p2_reg = abs( [width 1 1] * tform_raw.T);
    p3_reg = abs( [1 height 1] * tform_raw.T);
    start_point = ceil( [max(p1_reg(1), p3_reg(1)), max(p1_reg(2), p2_reg(2))]);
    dat_reg = zeros(PV_SIZE_, PV_SIZE_, length);
    for i = 1:length
        temp = imwarp( dat_raw(:,:,i), tform_raw, 'bicubic');
%         dat_lw_reg(:,:,i) = temp( start_point(2) + 1 : start_point(2) + PV_SIZE_, start_point(1) + 1 : start_point(1) + PV_SIZE_);
        dat_reg(:,:,i) = temp( start_point(2) + 1 : start_point(2) + PV_SIZE_, start_point(1) + 1 : start_point(1) + PV_SIZE_);
    end
end



% start_point = ceil( [max(p1_reg(1), p3_reg(1)), max(p1_reg(2), p2_reg(2))])


