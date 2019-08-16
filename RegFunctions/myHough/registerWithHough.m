% img = img_sw_4;
% img = img_lw_2;
% img = img_lw_3;
% img = img_lw_4;
img = img_sw;
% img = img_sw;


% threholds_canny = [];
sigma = 1;
rho_resolution = 0.5;
% theta = -90:0.1:89;
theta_resolution = 0.1;
thresholds_coef = 0.5;
% hood_size_coef = 50;
fill_gap = 35;
min_length = 50;
[BW, H, P, lines] = myHougLine(img, sigma, rho_resolution, theta_resolution, thresholds_coef, fill_gap, min_length);
% figure, imshow(BW);

% BW_lw = BW;
% H_lw = H;
% P_lw = P;
% lines_lw = lines;
% myHougLine(img, thresholds_canny, sigma, rho_resolution, theta,
% thresholds_coef, hood_size_coef, fill_gap, min_length);
% points = myGetPointsFromHoughLines(lines); 
points = myGetPointsFromHoughLines2(lines); 

% points(:,2) = rem( points(:,2), 240);
plot(points(:,1), points(:,2), 'x', 'LineWidth', 6,'MarkerSize', 18, 'MarkerEdgeColor','blue'); hold off;

