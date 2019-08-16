% use myPyramidSample first
[BW_lw_up_2, H_lw_up_2, P_lw_up_2, lines_lw_up_2, points_lw_up_2] = pyramidHoughPointDetector(img_lw_up_2, 4.5, 2, 1, 0.5, 150, 200);

[BW_lw_up_1, H_lw_up_1, P_lw_up_1, lines_lw_up_1, points_lw_up_1] = pyramidHoughPointDetector(img_lw_up_1, 3, 1, 0.5, 0.495, 70, 100);

[BW_lw, H_lw, P_lw, lines_lw, points_lw] = pyramidHoughPointDetector(img_lw, 1, 0.5, 0.1, 0.55, 35, 50);

[BW_lw_down_1, H_lw_down_1, P_lw_down_1, lines_lw_down_1, points_lw_down_1] = pyramidHoughPointDetector(img_lw_down_1, 1, 0.5, 0.1, 0.6, 25, 30);

[BW_lw_down_2, H_lw_down_2, P_lw_down_2, lines_lw_down_2, points_lw_down_2] = pyramidHoughPointDetector(img_lw_down_2, 0.2, 0.5, 0.1, 0.55, 12, 15);

[BW_sw_up_2, H_sw_up_2, P_sw_up_2, lines_sw_up_2, points_sw_up_2] = pyramidHoughPointDetector(img_sw_up_2, 4.5, 2, 1, 0.45, 150, 200);

[BW_sw_up_1, H_sw_up_1, P_sw_up_1, lines_sw_up_1, points_sw_up_1] = pyramidHoughPointDetector(img_sw_up_1, 3, 1, 0.5, 0.5, 70, 100);

[BW_sw, H_sw, P_sw, lines_sw, points_sw] = pyramidHoughPointDetector(img_sw, 1, 0.5, 0.1, 0.55, 35, 50);

[BW_sw_down_1, H_sw_down_1, P_sw_down_1, lines_sw_down_1, points_sw_down_1] = pyramidHoughPointDetector(img_sw_down_1, 0.1, 0.5, 0.1, 0.5, 25, 30);

[BW_sw_down_2, H_sw_down_2, P_sw_down_2, lines_sw_down_2, points_sw_down_2] = pyramidHoughPointDetector(img_sw_down_2, 0.2, 0.5, 0.1, 0.4, 12, 15);



