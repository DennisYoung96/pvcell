function outline_area = getArea(max_outline)
    for i = 1:size(max_outline,1)
        for j = 1:size(max_outline,2)
            outline_area{i,j} = getOneArea( max_outline{i,j});
        end
    end
end
% 最大轮廓定义
% 1 _______ 2
%   |     | 
%   |     | 
% 3 ------- 4
% 使用海伦公式，将四边形化为两个三角形


function one_outline_area = getOneArea(max_outline_temp)
%     max_outline_temp = max_outline_temp{1,1};
    % A = max_outline_temp(1,:);
    % B = max_outline_temp(2,:);
    % C = max_outline_temp(3,:);
    % D = max_outline_temp(4,:);
    for i = 1:size(max_outline_temp,1)
        if i == 4
            l(i) = norm( dist( max_outline_temp(i), max_outline_temp(1)));
        else
            l(i) = norm( dist( max_outline_temp(i), max_outline_temp(i + 1)));
        end
    end
    p1 = sum( l(1:3)) / 2;
    s1 = sqrt( p1 * ( p1 - l(1)) * ( p1 - l(2)) * ( p1 - l(3)));
    p2 = sum( l(2:4)) / 2;
    s2 = sqrt( p2 * ( p2 - l(2)) * ( p2 - l(3)) * ( p2 - l(4)));
    one_outline_area = s1 + s2;
end
