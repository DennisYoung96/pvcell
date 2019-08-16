%% Outline
% 最大轮廓定义
% 1 _______ 2
%   |     | 
%   |     | 
% 3 ------- 4
function max_outline = getMaxOutline(hough_intersection)
    for i = 1:size(hough_intersection, 1)
        for j = 1:size(hough_intersection, 2)
            max_outline{i,j} = getOneMaxOutline( hough_intersection{i,j});
        end
    end
end

function max_outline_temp = getOneMaxOutline(hough_intersection_temp)
    max_outline_temp =zeros(4,2);
    hough_intersection_temp_sum = sum(hough_intersection_temp,2);
    max_outline_temp(1,:) = hough_intersection_temp( min( hough_intersection_temp_sum) == hough_intersection_temp_sum,:);
    max_outline_temp(4,:) = hough_intersection_temp( max( hough_intersection_temp_sum) == hough_intersection_temp_sum,:);

    temp = [max_outline_temp(4,1), max_outline_temp(1,2)];
    max_outline_temp(2,:) = findNearestPoint(hough_intersection_temp, temp);
    temp = [max_outline_temp(1,1), max_outline_temp(4,2)];
    max_outline_temp(3,:) = findNearestPoint(hough_intersection_temp, temp);
end

function points_found = findNearestPoint(hough_intersection_temp, points_tobefind)
    for i = 1:size(hough_intersection_temp,1)
        dist_table(i) = sum((hough_intersection_temp(i,:) - points_tobefind).^2);
    end
    points_found = hough_intersection_temp(min(dist_table) == dist_table,:);
end




