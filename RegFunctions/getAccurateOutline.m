%% 通过插值找到最精确的点
function accurate_outline = getAccurateOutline(outline_area, max_outline,outline_area_index)
    hough_ratio = [1/4, 1/2, 1 , 2, 4];
%     p_hough_ratio =sqrt( [4, 2, 1 , 1/2, 1/4; 4, 2, 1 , 1/2, 1/4]);
        p_hough_ratio =sqrt( [1, 1, 1 , 1/2, 1/4; 1, 1, 1 , 1/2, 1/4]);

    % 尺度
    for i = 1:size(max_outline,1)
        for j = 1:size(max_outline,2)
%             max_outline{i,j}= (max_outline{i,j} - 1) * hough_ratio(j) + 1;
            max_outline{i,j}= max_outline{i,j} * hough_ratio(j);
            outline_area{i,j} = outline_area{i,j} * hough_ratio(j) * hough_ratio(j);

        end
    end
    % 基于测量确定度的融合
    % 使用方差确定
    % P1 : P2 : P3 : ··· = 1/var1 : 1/var2 : 1/var3 : ···  
    outline_area = cell2mat(outline_area);
    for i = 1:size(outline_area,1) % 2
        for j = 1:size(outline_area,2) % 5
            outline_area_temp = outline_area(i,:);
            outline_area_temp(j) = [];
%           outline_area_mean(i,j) = mean( outline_area_temp);
            outline_area_var(i,j) = var( outline_area_temp);
        end
    end
    % P 用于表示加权
    P = outline_area_var .* p_hough_ratio;
    for i = 1:size(max_outline,1)
        P(i,:) = P(i,:) / min(P(i,:));
    end
    for i = 1:size(max_outline,1)
        temp = 0;
        for j = 1:size(max_outline,2)
            if outline_area_index(i,j) ~= 0        
                  temp = temp + (max_outline{i,j} - 1) * P(i,j);
                % temp = temp + (max_outline{i,j} - 1) ./ outline_area_var(i,j);
%                 temp = temp + max_outline{i,j} / outline_area_std(i,j) - 1;
%                 temp = temp + max_outline{i,j};
            end
        end
                a = sum( P(i, outline_area_index(i,:)));
%         a = sum( outline_area_index(i,:) .* outline_area_var(outline_area_index(i,:)));

%         a = sum( outline_area_index(i,:) .* hough_ratio(outline_area_index(i,:)));
%         a = sum( outline_area_index(i,end-1));
%         accurate_outline{i} = temp .* a + 1;
                accurate_outline{i} = temp ./ a + 1;

    end
end
