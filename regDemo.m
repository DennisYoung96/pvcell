%% 2. ��׼
%% ��ȡ�ļ�
% FILE_DIR_PATH_ = 'D:\TASK\������\���һ������\NEW\RO08\';
% FILE_NAME_READ_ = 'RO08_16V_T';
% addpath( FILE_DIR_PATH_);
% load( FILE_NAME_READ_);
% addpath( genpath( pwd));

%%
up_level = 2;
down_level = 2;
dat_raw = dat_start;
% img_raw = histeq(mat2gray(dat_raw(:,:,900)));
img_raw = dat_raw(:,:,500);
img_pyramid = getImgPyramid(img_raw, up_level, down_level);
load('hough_para_RM06_302A');
%%
[hough_intersection, img_pyramid] = getTForm(img_pyramid, hough_para);

%
hough_intersection{5} = hough_intersection{4} / 2;

%% ������� 
max_outline = getMaxOutline( hough_intersection);
outline_area = getArea(max_outline);
% ȥ������
outline_area_index = getRidOfOutlier(outline_area);
% ��Ͼ�ȷ��
accurate_outline = getAccurateOutline(outline_area, max_outline,outline_area_index);

% Ŀ���С
PV_SIZE_ = 256;
object_img_size = [1 1; PV_SIZE_ 1; 1 PV_SIZE_; PV_SIZE_ PV_SIZE_];
%% ��ȷ���
accurate_tform_to_object = fitgeotrans(cell2mat( accurate_outline), object_img_size, 'projective');
accurate_img_to_object = getRegDat(PV_SIZE_, img_raw, accurate_tform_to_object);
dat_reg = getRegDat( PV_SIZE_, dat_raw, accurate_tform_to_object);
%% ����
%% �뵥�εĶԱ�
single_tform_to_object = fitgeotrans(max_outline{3}, object_img_size, 'projective');
single_img_to_object = getRegDat(PV_SIZE_, img_raw, single_tform_to_object);
% reg_val_single = regEvaluation( single_img_to_object, single_img_sw_to_object, 8);
figure(1); imshow( mat2gray( accurate_img_to_object));
figure(2); imshow( mat2gray( single_img_to_object));

dat_reg = getRegDat( PV_SIZE_, dat_raw, single_tform_to_object);
figure; imshow( mat2gray( dat_reg(:,:,2)));

% ����
RO08_16V_T_REG = dat_reg;

save D:\TASK\������\���һ������\NEW\RO08\RO08_16V_T_REG RO08_16V_T_REG















