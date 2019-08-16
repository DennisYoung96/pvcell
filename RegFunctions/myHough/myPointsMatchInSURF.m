% this algorithm doesn't work because of the noise and low SNR

movingPointsAdjusted = cpcorr(points_lw,points_sw,img_lw,img_sw);

    [features1,valid_points1] = extractFeatures(histeq(img_lw), movingPointsAdjusted);
    [features2,valid_points2] = extractFeatures(histeq(img_sw), points_sw);
%     movingPointsAdjusted = cpcorr(points_lw,points_sw,img_lw,img_sw);
    indexPairs = matchFeatures(features1,features2);
    
    matchedPoints1 = valid_points1(indexPairs(:,1),:);
    matchedPoints2 = valid_points2(indexPairs(:,2),:);
    
%     figure; showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2); 
    
    figure; ax = axes;
    showMatchedFeatures(histeq(img_lw),histeq(img_sw),matchedPoints1,matchedPoints2,'montage','Parent',ax);
    title(ax, 'rgb and depth matches');