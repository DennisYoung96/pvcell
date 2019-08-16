% % mytform = fitgeotrans(movingPoints, fixedPoints, 'projective');
% 
% 
% 
% 
% 
% mytform = fitgeotrans(movingPointsAdjusted, fixedPoints, 'projective');
% ther_img_reg = imwarp(lw_img, mytform);
% % 这里主要是对齐位移
% % plot(movingPointsAdjusted(1:8,1),movingPointsAdjusted(1:8,2),'c*','MarkerSize',20,'MarkerEdgeColor','r')
p_lw = points_lw;
p_lw(1:4,:) = sort(p_lw(1:4,:)); 
p_lw(5:8,:) = sort(p_lw(5:8,:));

p_sw = points_sw;
p_sw(1:4,:) = sort(p_sw(1:4,:)); 
p_sw(5:8,:) = sort(p_sw(5:8,:));
temp_tt = p_sw(1:4,:);
p_sw(1:4,:) = p_sw(5:8,:);
p_sw(5:8,:) = temp_tt;
clear temp_tt;

mytform = fitgeotrans(p_lw, p_sw, 'projective');
img_lw_2 = imwarp(img_lw, mytform);





% 
num = uint8( ceil ( abs(-mytform.T(3,1))));

% 这里如果带入 num 就会错
% 很奇怪的bug
% sw_reg = zeros(size(ther_reg));
% % for i = 1:size(sw,1)
% %     for j = 1:size(sw,2)
% for i = 1:256
%     for j = 1:320        
%         sw_reg(i+num, j+num) = sw(i,j);
%     end
% end
% iimmgg = zeros(size(ther_img_reg));
iimmgg = zeros(size(img_lw_2));

for i = 1:256   
    for j = 1:290
        iimmgg(i+26, j+4) = img_sw(i,j);
    end
end
figure, imshowpair(histeq(iimmgg), img_lw_2, 'montage'); hold on;
% 'falsecolor'	Creates a composite RGB image showing A and B overlaid in different color bands. Gray regions in the composite image show where the two images have the same intensities. Magenta and green regions show where the intensities are different. This is the default method.
% 'blend'	Overlays A and B using alpha blending.
% 'checkerboard'	Creates an image with alternating rectangular regions from A and B.
% 'diff'	Creates a difference image from A and B.
% 'montage'     Places A and B next to each other in the same image.

for k = 1:length(lines)
	xy = [lines(k).point1; lines(k).point2];
	rho_d = lines(k).rho;
	theta_d = lines(k).theta;
	if abs( lines(k).theta ) < 10
        drawline([xy(1,1) xy(1,2)] + [4,26], [xy(2,1) xy(2,2)] + [4,26], 'green', img_lw_2);
    else
        drawline([xy(1,1) xy(1,2)] + [4,26], [xy(2,1) xy(2,2)] + [4,26], 'red', img_lw_2);hold on;
    end
end
xy = p_sw;

plot(xy(:,1)+4, xy(:,2)+26, 'x', 'LineWidth', 6,'MarkerSize', 18, 'MarkerEdgeColor','blue'); hold off;
