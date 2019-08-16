%% 热成像 
function [hough_intersection, img_pyramid] = getTForm(img_pyramid, hough_para)
    for i = 1 : 5 
    [img_pyramid{2,i}, img_pyramid{3,i}, img_pyramid{4,i}, img_pyramid{5,i}, img_pyramid{6,i}]...
        = pyramidHoughPointDetector2(img_pyramid{1,i}, hough_para(:,i));
    end
    hough_intersection = pointRecovery2(img_pyramid);   
end
%% 从 lw sw 数组中取出交点
% 交点位置 img_lw_pyramid(6,:)
function hough_intersection = pointRecovery2( img_pyramid)
    for i = 1:size(img_pyramid,2)
        hough_intersection_temp = unique( img_pyramid{6,i},'rows');
        hough_intersection{i} = getRidOfClosePoints( hough_intersection_temp);
    end
end    
%% 去除接近的点
% 12.20
% 增加 eps 变量，来作为判定的条件，eps是点的距离控制变量
function hough_intersection_new = getRidOfClosePoints(hough_intersection_temp)
    eps_1 = (max( hough_intersection_temp(:,1)) - min( hough_intersection_temp(:,1))) / size(hough_intersection_temp, 1);
    eps_2 = (max( hough_intersection_temp(:,2)) - min( hough_intersection_temp(:,2))) / size(hough_intersection_temp, 1);
    eps_ratio = 0.2;
    eps = eps_ratio * sqrt( eps_1.^2 + eps_2.^2);
    for j = 1:size(hough_intersection_temp,1) - 1
        for k = j+1:size(hough_intersection_temp,1)                 
            if   power( sum( power((hough_intersection_temp(j,:) - hough_intersection_temp(k,:)), 2)), 0.5) < 10
                hough_intersection_temp(j,:) = hough_intersection_temp(j,:)/2 + hough_intersection_temp(k,:)/2;
                hough_intersection_temp(k,:) = 0;      
           
            end                
        end
    end
    hough_intersection_temp = sortrows(hough_intersection_temp,1);    
    drop_sum = sum(hough_intersection_temp == [0,0]);
%     if(drop_sum(1) ~= drop_sum(2))
%         error('Unepectable zeros!');
%     end    
    hough_intersection_temp = hough_intersection_temp(drop_sum(1)+1:end ,:);    
    hough_intersection_new = hough_intersection_temp;  
end