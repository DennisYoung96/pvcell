function points = myGetPointsFromHoughLines(lines)
%   从霍夫变换直线中提取交点
%   假定电池板子放的不错，将直线分为水平与竖直两组
%   降低计算量
    rho = [ lines.rho];
    theta = [ lines.theta];
%     p1 = [lines.point1];
%     p2 = [lines.point2];
    
    theta_horizontal = theta( theta>-10 & theta<10);
    rho_horizontal = rho( theta>-10 & theta<10);
%     idx_horizontal = theta>-10 & theta<10;
%     p1_horizontal = p1(idx_horizontal);
%     p2_horizontal = p2(idx_horizontal);
    
    theta_vertical = theta( theta<-80 | theta>80);
    rho_vertical = rho( theta<-80 | theta>80);
%     idx_vertical = theta<-80 | theta>80;
%     p1_vertical = p1(idx_vertical);
%     p2_vertical = p2(idx_vertical);
    
    num_theta_horizontal = numel(theta_horizontal);
    num_theta_vertical = numel(theta_vertical);

%     num_theta_horizontal = sum(idx_horizontal);
%     num_theta_vertical = sum(idx_vertical);    
    num_points = num_theta_horizontal * num_theta_vertical;    
    points = zeros([num_points,2]);
    
    k = 1;
    for i = 1:num_theta_horizontal
        for j = 1:num_theta_vertical
%             [p1_horizontal(i), p2_horizontal(i), p1_vertical(j), p2_vertical(j)];
            points(k,:) = myFindCrosspoint(rho_horizontal(i), theta_horizontal(i), rho_vertical(j), theta_vertical(j));
%             points(k,:) = myFindCrosspoint(p1_horizontal(i), p2_horizontal(i), p1_vertical(j), p2_vertical(j));
            k = k+1;
        end
    end
end

