% function myDrawLineFromPoints(p1, p2, theta, rho, img)
%    [x,y] = size(img);
%    if abs(theta) < 10
%        % rho = x * cos(theta) + y * sin(theta)
%        id1 = (rho - (0.5)*sin(theta)) / cos(theta);
%        id2 = (rho - (y+0.5)*sin(theta)) / cos(theta);
%        plot([id1,0], [id2,y+1],'LineWidth',6,'Color','yellow');hold on;        
%    else % abs(theta) > 80
%        % rho = x * cos(theta) + y * sin(theta)
%        id1 = (rho - (0.5)*cos(theta)) / sin(theta);
%        id2 = (rho - (x+0.5)*cos(theta)) / sin(theta);
%        plot([0,id1,], [y+1,id2],'LineWidth',6,'Color','yellow');hold on;        
%      
%    end
% end

% function myDrawLineFromPoints(p1, p2, xlim)
%     xlim = xlim';
% 
%     if p1(1) == p2(1)
%         k = (p2(2) - p1(2)) / (p2(1) - p1(1));
%         y0 = p1(2) + k*(xlim(1) - p1(1));
%         y1 = p1(2) + k*(xlim(2) - p1(1));        
%         plot([xlim(1),y0], [xlim(2),y1],'LineWidth',6,'Color','yellow');hold on;        
%     else
%         k = (p2(2) - p1(2)) / (p2(1) - p1(1));
%         y0 = p1(2) + k*(xlim(1) - p1(1));
%         y1 = p1(2) + k*(xlim(2) - p1(1));        
%         plot([y0, xlim(1)], [y1, xlim(2)],'LineWidth',6,'Color','green');hold on;        
%     end
% end