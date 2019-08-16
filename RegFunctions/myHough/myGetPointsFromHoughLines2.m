function points = myGetPointsFromHoughLines2(lines)
%   从霍夫变换直线中提取交点
%   假定电池板子放的不错，将直线分为水平与竖直两组
%   降低计算量
%     rho = [ lines.rho];
    theta = [ lines.theta];
    p1 = [lines.point1];
    p2 = [lines.point2];
    
%     theta_horizontal = theta( theta>-10 & theta<10);
%     rho_horizontal = rho( theta>-10 & theta<10);
    idx_horizontal = find(theta>-10 & theta<10);
    num_horizontal = numel(idx_horizontal);
    p1_horizontal = zeros(num_horizontal,2);
    p2_horizontal = zeros(num_horizontal,2);
    for i = 1:num_horizontal
        p1_horizontal(i,:) = p1(idx_horizontal(i)*2-1:idx_horizontal(i)*2);
        p2_horizontal(i,:) = p2(idx_horizontal(i)*2-1:idx_horizontal(i)*2);        
    end

    
%     theta_vertical = theta( theta<-80 | theta>80);
%     rho_vertical = rho( theta<-80 | theta>80);
    idx_vertical = find(theta<-80 | theta>80);
    num_vertical = numel(idx_vertical);
    p1_vertical = zeros(num_vertical,2);
    p2_vertical = zeros(num_vertical,2);    
    for i = 1:num_vertical
        p1_vertical(i,:) = p1(idx_vertical(i)*2-1:idx_vertical(i)*2);
        p2_vertical(i,:) = p2(idx_vertical(i)*2-1:idx_vertical(i)*2);        
    end

    
%     num_theta_horizontal = numel(theta_horizontal);
%     num_theta_vertical = numel(theta_vertical);
%     num_theta_horizontal = sum(idx_horizontal);
%     num_theta_vertical = sum(idx_vertical);    
    num_theta_horizontal = num_horizontal;
    num_theta_vertical = num_vertical;  
    
    num_points = num_theta_horizontal * num_theta_vertical;    
    points = zeros([num_points,2]);
    
    k = 1;
    for i = 1:num_theta_horizontal
        for j = 1:num_theta_vertical
%             [p1_horizontal(i), p2_horizontal(i), p1_vertical(j), p2_vertical(j)];
%             points(k,:) = myFindCrosspoint(rho_horizontal(i), theta_horizontal(i), rho_vertical(j), theta_vertical(j));
            
            points(k,:) = myFindCrosspoint2(p1_horizontal(i,:), p2_horizontal(i,:), p1_vertical(j,:), p2_vertical(j,:));
            k = k+1;
        end
    end
end
