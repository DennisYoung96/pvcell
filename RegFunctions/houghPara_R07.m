%% 霍夫变换检测的参数
% |  parameter name  |          parameter argument      
% |      sigma       | the delta of gaussian blur
% |  rho_resolution  | the rho resolution in hough space
% | theta_resolution | the theta resolution in hough space
% |  threshold_coef  | the ratio to max value in hough space
% |      fill_gap    | the maxima gap to fill 
% |     min_length   | the minima length of hough lines


% global hough_para;
hough_para(1,1,1) = 14;
hough_para(1,2,1) = 2;
hough_para(1,3,1) = 1;
hough_para(1,4,1) = 0.3;
hough_para(1,5,1) = 300;
hough_para(1,6,1) = 400;
% 
hough_para(1,1,2) = 7;
hough_para(1,2,2) = 1;
hough_para(1,3,2) = 0.5;
hough_para(1,4,2) = 0.3;
hough_para(1,5,2) = 150;
hough_para(1,6,2) = 200;
%
hough_para(1,1,3) = 3.5;
hough_para(1,2,3) = 0.5;
hough_para(1,3,3) = 0.25;
hough_para(1,4,3) = 0.4;
hough_para(1,5,3) = 100;
hough_para(1,6,3) = 100;
% 
hough_para(1,1,4) = 1;
hough_para(1,2,4) = 0.25;
hough_para(1,3,4) = 0.25;
hough_para(1,4,4) = 0.4;
hough_para(1,5,4) = 40;
hough_para(1,6,4) = 75;
%
hough_para(1,1,5) = 1;
hough_para(1,2,5) = 0.25;
hough_para(1,3,5) = 0.25;
hough_para(1,4,5) = 0.45;
hough_para(1,5,5) = 25;
hough_para(1,6,5) = 30;

%%
hough_para(2,1,1) = 7;
hough_para(2,2,1) = 2;
hough_para(2,3,1) = 1;
hough_para(2,4,1) = 0.2;
hough_para(2,5,1) = 150;
hough_para(2,6,1) = 200;
%
hough_para(2,1,2) = 3.5;
hough_para(2,2,2) = 1;
hough_para(2,3,2) = 0.5;
hough_para(2,4,2) = 0.2;
hough_para(2,5,2) = 70;
hough_para(2,6,2) = 100;

%
hough_para(2,1,3) = 1.75;
hough_para(2,2,3) = 0.5;
hough_para(2,3,3) = 0.25;
hough_para(2,4,3) = 0.2;
hough_para(2,5,3) = 35;
hough_para(2,6,3) = 50;

%
hough_para(2,1,4) = 1;
hough_para(2,2,4) = 0.25;
hough_para(2,3,4) = 0.25;
hough_para(2,4,4) = 0.25;
hough_para(2,5,4) = 20;
hough_para(2,6,4) = 25;

%
hough_para(2,1,5) = 1;
hough_para(2,2,5) = 0.25;
hough_para(2,3,5) = 0.25;
hough_para(2,4,5) = 0.3;
hough_para(2,5,5) = 10;
hough_para(2,6,5) = 15;

save 'hough_para_R07.mat' hough_para
% hough_para(1,1,1) = 15;
% hough_para(1,2,1) = 2;
% hough_para(1,3,1) = 1;
% hough_para(1,4,1) = 0.3;
% hough_para(1,5,1) = 300;
% hough_para(1,6,1) = 400;
% % 
% hough_para(1,1,2) = 7;
% hough_para(1,2,2) = 2;
% hough_para(1,3,2) = 1;
% hough_para(1,4,2) = 0.4;
% hough_para(1,5,2) = 150;
% hough_para(1,6,2) = 200;
% %
% hough_para(1,1,3) = 3.5;
% hough_para(1,2,3) = 1;
% hough_para(1,3,3) = 0.5;
% hough_para(1,4,3) = 0.5;
% hough_para(1,5,3) = 70;
% hough_para(1,6,3) = 100;
% % 
% hough_para(1,1,4) = 1.75;
% hough_para(1,2,4) = 0.5;
% hough_para(1,3,4) = 0.25;
% hough_para(1,4,4) = 0.4;
% hough_para(1,5,4) = 35;
% hough_para(1,6,4) = 50;
% %
% hough_para(1,1,5) = 1;
% hough_para(1,2,5) = 0.25;
% hough_para(1,3,5) = 0.125;
% hough_para(1,4,5) = 0.5;
% hough_para(1,5,5) = 25;
% hough_para(1,6,5) = 30;
% 
% %%
% hough_para(2,1,1) = 9;
% hough_para(2,2,1) = 2;
% hough_para(2,3,1) = 1;
% hough_para(2,4,1) = 0.45;
% hough_para(2,5,1) = 50;
% hough_para(2,6,1) = 200;
% %
% hough_para(2,1,2) = 4;
% hough_para(2,2,2) = 2;
% hough_para(2,3,2) = 1;
% hough_para(2,4,2) = 0.4;
% hough_para(2,5,2) = 50;
% hough_para(2,6,2) = 125;
% %
% hough_para(2,1,3) = 4;
% hough_para(2,2,3) = 2;
% hough_para(2,3,3) = 1;
% hough_para(2,4,3) = 0.45;
% hough_para(2,5,3) = 35;
% hough_para(2,6,3) = 50;
% 
% %
% hough_para(2,1,4) = 1;
% hough_para(2,2,4) = 1;
% hough_para(2,3,4) = 0.5;
% hough_para(2,4,4) = 0.5;
% hough_para(2,5,4) = 25;
% hough_para(2,6,4) = 30;
% 
% %
% hough_para(2,1,5) = 1;
% hough_para(2,2,5) = 0.5;
% hough_para(2,3,5) = 0.1;
% hough_para(2,4,5) = 0.5;
% hough_para(2,5,5) = 12;
% hough_para(2,6,5) = 20;
% 
% save 'hough_para_R07.mat' hough_para

% 
% global hough_para;
% % 
% hough_para.lw_up_2.sigma = 15;
% hough_para.lw_up_2.rho_resolution = 2;
% hough_para.lw_up_2.theta_resolution = 1;
% hough_para.lw_up_2.threshold_coef = 0.5;
% hough_para.lw_up_2.fill_gap = 150;
% hough_para.lw_up_2.min_length = 200;
% % 
% hough_para.lw_up_1.sigma = 7.5;
% hough_para.lw_up_1.rho_resolution = 2;
% hough_para.lw_up_1.theta_resolution = 0.5;
% hough_para.lw_up_1.threshold_coef = 0.5;
% hough_para.lw_up_1.fill_gap = 150;
% hough_para.lw_up_1.min_length = 200;
% %
% hough_para.lw_raw.sigma = 3;
% hough_para.lw_raw.rho_resolution = 1;
% hough_para.lw_raw.theta_resolution = 0.5;
% hough_para.lw_raw.threshold_coef = 0.5;
% hough_para.lw_raw.fill_gap = 70;
% hough_para.lw_raw.min_length = 100;
% % 
% hough_para.lw_down_1.sigma = 1;
% hough_para.lw_down_1.rho_resolution = 0.5;
% hough_para.lw_down_1.theta_resolution = 0.5;
% hough_para.lw_down_1.threshold_coef = 0.5;
% hough_para.lw_down_1.fill_gap = 35;
% hough_para.lw_down_1.min_length = 50;
% %
% hough_para.lw_down_2.sigma = 1;
% hough_para.lw_down_2.rho_resolution = 0.5;
% hough_para.lw_down_2.theta_resolution = 0.5;
% hough_para.lw_down_2.threshold_coef = 0.5;
% hough_para.lw_down_2.fill_gap = 25;
% hough_para.lw_down_2.min_length = 30;
% 
% %%
% hough_para.sw_up_2.sigma = 3;
% hough_para.sw_up_2.rho_resolution = 1;
% hough_para.sw_up_2.theta_resolution = 0.5;
% hough_para.sw_up_2.threshold_coef = 0.5;
% hough_para.sw_up_2.fill_gap = 150;
% hough_para.sw_up_2.min_length = 200;
% %
% hough_para.sw_up_1.sigma = 3;
% hough_para.sw_up_1.rho_resolution = 1;
% hough_para.sw_up_1.theta_resolution = 0.5;
% hough_para.sw_up_1.threshold_coef = 0.5;
% hough_para.sw_up_1.fill_gap = 70;
% hough_para.sw_up_1.min_length = 100;
% %
% hough_para.sw_raw.sigma = 1;
% hough_para.sw_raw.rho_resolution = 0.5;
% hough_para.sw_raw.theta_resolution = 0.1;
% hough_para.sw_raw.threshold_coef = 0.5;
% hough_para.sw_raw.fill_gap = 35;
% hough_para.sw_raw.min_length = 50;
% %
% hough_para.sw_down_1.sigma = 1 ;
% hough_para.sw_down_1.rho_resolution = 1;
% hough_para.sw_down_1.theta_resolution = 0.5;
% hough_para.sw_down_1.threshold_coef = 0.5;
% hough_para.sw_down_1.fill_gap = 25;
% hough_para.sw_down_1.min_length = 30;
% %
% hough_para.sw_down_2.sigma = 0.0001 ;
% hough_para.sw_down_2.rho_resolution = 0.5;
% hough_para.sw_down_2.theta_resolution = 0.1;
% hough_para.sw_down_2.threshold_coef = 0.5;
% hough_para.sw_down_2.fill_gap = 12;
% hough_para.sw_down_2.min_length = 15;
% 
% save 'hough_para.mat' hough_para