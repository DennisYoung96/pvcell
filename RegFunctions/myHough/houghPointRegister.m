% pyramidHoughPointDetector(img_lw, sigma, rho_resolution, theta_resolution, thresholds_coef, fill_gap, min_length)




[r_BW, r_H, r_P, r_lines, r_points] = pyramidHoughPointDetector(img_lw, 1, 0.5, 0.1, 0.55, 35, 50);
% BW(1) = r_BW;
% H(1) = r_H;
% P(1) = r_P;
% lines(1) = r_lines;
% points(1) = r_points;
[r_BW, r_H, r_P, r_lines, r_points] = pyramidHoughPointDetector(img_lw_2, 0.1, 0.05, 0.01, 0.5, 40, 25);
% BW(2) = r_BW;
% H(2) = r_H;
% P(2) = r_P;
% lines(2) = r_lines;
% points(2) = r_points;
[r_BW, r_H, r_P, r_lines, r_points] = pyramidHoughPointDetector(img_lw_3, 0.0001, 0.05, 0.01, 0.5, 50, 20);
% BW(3) = r_BW;
% H(3) = r_H;
% P(3) = r_P;
% lines(3) = r_lines;
% points(3) = r_points;
[r_BW, r_H, r_P, r_lines, r_points] = pyramidHoughPointDetector(img_lw_4, 0.01, 0.05, 0.01, 0.5, 20, 10);
% BW(4) = r_BW;
% H(4) = r_H;
% P(4) = r_P;
% lines(4) = r_lines;
% points(4) = r_points;

[r_BW, r_H, r_P, r_lines, r_points] = pyramidHoughPointDetector(img_sw, 1, 0.5, 0.1, 0.55, 35, 50);
[r_BW, r_H, r_P, r_lines, r_points] = pyramidHoughPointDetector(img_sw_2, 1, 0.05, 0.01, 0.5, 40, 25);
[r_BW, r_H, r_P, r_lines, r_points] = pyramidHoughPointDetector(img_sw_3, 0.0001, 0.05, 0.01, 0.5, 50, 20);
[r_BW, r_H, r_P, r_lines, r_points] = pyramidHoughPointDetector(img_sw_4, 0.01, 0.05, 0.01, 0.5, 20, 10);



% [r_BW, r_H, r_P, r_lines, r_points] = pyramidHoughPointDetector(img_lw_m2, 1, 0.5, 0.1, 0.55, 35, 50);
% [r_BW, r_H, r_P, r_lines, r_points] = pyramidHoughPointDetector(img_lw_m3, 1, 0.5, 0.1, 0.55, 35, 50);
% [r_BW, r_H, r_P, r_lines, r_points] = pyramidHoughPointDetector(img_lw_m4, 1, 0.5, 0.1, 0.55, 35, 50);
% 
% [r_BW, r_H, r_P, r_lines, r_points] = pyramidHoughPointDetector(img_sw_m2, 1, 0.5, 0.1, 0.55, 35, 50);
% [r_BW, r_H, r_P, r_lines, r_points] = pyramidHoughPointDetector(img_sw_m3, 1, 0.5, 0.1, 0.55, 35, 50);
% [r_BW, r_H, r_P, r_lines, r_points] = pyramidHoughPointDetector(img_sw_m4, 1, 0.5, 0.1, 0.55, 35, 50);










