function drawline(p1, p2 , color, img)
%enter code here
    dx = abs( p1(1) - p2(1));
    dy = abs( p1(2) - p2(2));
    lim = max(size(img,1), size(img,2));
    if dx ==0
        x = [0.5,lim+0.5];
        y = [p2(1),p2(1)];
        plot(y, x, color, 'LineWidth',6); hold on;
    elseif dy == 0
        x = [p2(2);p2(2)];
        y = [0.5;lim+0.5];
        plot(y, x, color, 'LineWidth',6); hold on;        
    else
        slope = (p2(2) - p1(2))/ (p2(1) - p1(1));
        syms x y 
        cond1 = y - p2(2) == slope * (x - p2(1));
        cond2 = x == 0;
        conds = [cond1 cond2];
        S1 = solve(conds, [x y]);
        syms x y 
        cond1 = y - p2(2) == slope * (x - p2(1));
        cond2 = x == lim;
        conds = [cond1 cond2];
        S2 = solve(conds, [x y]);
        syms x y 
        cond1 = y - p2(2) == slope * (x - p2(1));
        cond2 = y == 0;
        conds = [cond1 cond2];
        S3 = solve(conds, [x y]);
        syms x y 
        cond1 = y - p2(2) == slope * (x - p2(1));
        cond2 = y == 320;
        conds = [cond1 cond2];
        S4 = solve(conds, [x y]);        
        plot([S1.x S2.x], [S1.y S2.y], color, 'LineWidth',6); hold on;
    end

% function drawline(p1, p2 , color, img)
% %enter code here
%     dx = abs( p1(1) - p2(1));
%     dy = abs( p1(2) - p2(2));
%     lim = max(size(img,1), size(img,2));
%     if dx ==0
%         x = [0.5,lim+0.5];
%         y = [p2(1),p2(1)];
%         plot(y, x, color, 'LineWidth',6); hold on;
%     elseif dy == 0
%         x = [p2(2);p2(2)];
%         y = [0.5;lim+0.5];
%         plot(y, x, color, 'LineWidth',6); hold on;        
%     else
%         slope = (p2(2) - p1(2))/ (p2(1) - p1(1));
%         syms x y 
%         cond1 = y - p2(2) == slope * (x - p2(1));
%         cond2 = x == 0;
%         conds = [cond1 cond2];
%         S1 = solve(conds, [x y]);
%         syms x y 
%         cond1 = y - p2(2) == slope * (x - p2(1));
%         cond2 = x == 320;
%         conds = [cond1 cond2];
%         S2 = solve(conds, [x y]);
%         syms x y 
%         cond1 = y - p2(2) == slope * (x - p2(1));
%         cond2 = y == 0;
%         conds = [cond1 cond2];
%         S3 = solve(conds, [x y]);
%         syms x y 
%         cond1 = y - p2(2) == slope * (x - p2(1));
%         cond2 = y == 320;
%         conds = [cond1 cond2];
%         S4 = solve(conds, [x y]);        
%         plot([S1.x S2.x], [S1.y S2.y], color, 'LineWidth',6); hold on;
%     end
% 
% 
% %     theta = atan2( p2(2) - p1(2), p2(1) - p1(1));
% %     r = sqrt( (p2(1) - p1(1))^2 + (p2(2) - p1(2))^2);
% %     line = 0:0.01: r;
% %     x = p1(1) + line*cos(theta);
% %     y = p1(2) + line*sin(theta);
% %     plot(x, y, color, 'LineWidth',6); hold on;
% end