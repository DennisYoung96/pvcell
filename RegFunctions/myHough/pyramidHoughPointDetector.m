function [BW, H, P, lines, points] = pyramidHoughPointDetector(img, sigma, rho_resolution, theta_resolution, thresholds_coef, fill_gap, min_length)
% Detail is in registerWithHough
%     img = img_lw_m2;
%     sigma = 0.01;
%     rho_resolution = 0.05;
%     theta_resolution = 0.01;
%     thresholds_coef = 0.5;
%     fill_gap = 20;
%     min_length = 10;
    [BW, H, P, lines] = myHougLine(img, sigma, rho_resolution, theta_resolution, thresholds_coef, fill_gap, min_length);
    points = myGetPointsFromHoughLines2(lines);
    plot(points(:,1), points(:,2), 'x', 'LineWidth', 6,'MarkerSize', 18, 'MarkerEdgeColor','blue'); hold off;
end