%% ����������ж��Ƿ�õ�����ȷ��hough��Ե
function outline_area_index = getRidOfOutlier(outline_area)
    hough_ratio = [1/4, 1/2, 1 , 2, 4];
    % �����һ��
    for i = 1:size(outline_area,1)
        for j = 1:size(outline_area,2)
            outline_area{i,j}= outline_area{i,j} * hough_ratio(j) * hough_ratio(j);
        end
    end
    % �����ƽ��ֵ���׼��
    % ����һ��������ı�׼��
    outline_area = cell2mat(outline_area);
    for i = 1:size(outline_area,1) % 2
        for j = 1:size(outline_area,2) % 5
            outline_area_temp = outline_area(i,:);
            outline_area_temp(j) = [];
            outline_area_mean(i,j) = mean( outline_area_temp);
            outline_area_std(i,j) = sqrt( var( outline_area_temp));
        end
    end
    % ��������׼�����ж�
    outline_area_index = abs( outline_area - outline_area_mean) - 3 * outline_area_std < 0;
    outline_area;
end



