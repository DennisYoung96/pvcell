%% rho = x * cos(theta) + y*sin(theta)
% rho_1 = x * cos(theta_1) + y*sin(theta_1)
% rho_2 = x * cos(theta_2) + y*sin(theta_2)
%
%     point(1) = (rho_1 * sin(theta_2) - rho_2 * sin(theta_1)) / (sin(theta_2) * cos(theta_1) - sin(theta_1) * cos(theta_2)); % x
%     point(2) = (rho_1 * cos(theta_2) - rho_2 * cos(theta_1)) / (sin(theta_1) * cos(theta_2) - sin(theta_2) * cos(theta_1)); % y

% function point = myFindCrosspoint(rho_1, theta_1, rho_2, theta_2)
%     syms x y
%     
% %     rho_1 = rho_1;
% %     theta_1 = theta_1 - 90;
% %     rho_2 = -rho_2;
% %     theta_2 = theta_2 + 90;
%     
%     cond1 = rho_1 == cos(theta_1)*x + sin(theta_1)*y;
%     cond2 = -rho_2 == cos(theta_2)*x + sin(theta_2)*y;
%     conds = [cond1 cond2];
%     S = solve(conds, [x y]);
%     point(1) = S.x;
%     point(2) = S.y;
%     [rho_1, theta_1, rho_2, theta_2, point(1), point(2)]
% end
% 

function cross_point = myFindCrosspoint2(p1_horizontal, p2_horizontal, p1_vertical, p2_vertical)
%     points = [lines.point1, lines.point2];
    syms x y    
    cond1 = ( y - p1_horizontal(2)) * ( p2_horizontal(1) - p1_horizontal(1)) == (x - p1_horizontal(1)) * (p2_horizontal(2) - p1_horizontal(2));
    cond2 = ( y - p1_vertical(2)) * ( p2_vertical(1) - p1_vertical(1)) == (x - p1_vertical(1)) * (p2_vertical(2) - p1_vertical(2));
    conds = [cond1 cond2];
    S = solve(conds, [x y]);
    point(1) = S.x;
    point(2) = S.y;
    cross_point = [point(1), point(2)];
end






% function point = myFindCrosspoint(rho_1, theta_1, rho_2, theta_2)
% 
%     point = [0,0];
%     rho_1 = -rho_1;
%     theta_1 = theta_1 + 90;
%     rho_2 = -rho_2;
%     theta_2 = theta_2 + 90;
%     point(1) = 1 + (rho_1 * sin(theta_2) - rho_2 * sin(theta_1)) / (sin(theta_2) * cos(theta_1) - sin(theta_1) * cos(theta_2)); % x
% %     point(2) = (rho_1 - point(1) * cos(theta_1)) / sin(theta_1);
% %     point(2) = (rho_2 - point(1) * cos(theta_2)) / sin(theta_2);
% % [rho_1, theta_1, rho_2, theta_2, (rho_1 * cos(theta_2) - rho_2 * cos(theta_1)), sin(theta_1) * cos(theta_2) - sin(theta_2) * cos(theta_1)]
%     point(2) = (rho_1 * cos(theta_2) - rho_2 * cos(theta_1)) / (sin(theta_1) * cos(theta_2) - sin(theta_2) * cos(theta_1)); % y
% %     point(2) = (rho_1 * cos(theta_2) - rho_2 * cos(theta_1)) / (sin(theta_2) * cos(theta_1) - sin(theta_1) * cos(theta_2)); % y
% 
% end