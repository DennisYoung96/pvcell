%% function myHougLine(img, thresholds_canny, sigma, rho_resolution, theta, thresholds_coef, hood_size_coef, fill_gap, min_length)

function [BW, H, P, lines] = myHougLine(img, sigma, rho_resolution, theta_resolution, thresholds_coef, fill_gap, min_length)

    [~,~,ColorChannel] = size(img);
    if ColorChannel > 1
        img = rgb2gray(img);
    end
    BW = edge(img, 'canny', [], sigma);
    [H,theta,rho] = hough(BW, 'RhoResolution', rho_resolution, 'Theta', -90:theta_resolution:89);
    for i = 1000
        
%     P = houghpeaks(H,i,'threshold',ceil(0.3*max(H(:))));
        P = houghpeaks(H, i, 'threshold', ceil (thresholds_coef * max( H(:))));
%                 P = houghpeaks(H, i);

%     lines = houghlines(I, theta, rho, P, 'FillGap',fill_gap,'MinLength',100);
        lines = houghlines(BW, theta, rho, P, 'FillGap', fill_gap, 'MinLength', min_length);
                figure, imagesc( img), hold on;
                colorbar

%         figure, imshow(img), hold on

        for k = 1:length(lines)
        % Plot beginnings and ends of lines
            xy = [lines(k).point1; lines(k).point2];
            rho_d = lines(k).rho;
            theta_d = lines(k).theta;
            xlim = get(gca,'XLim');
            if abs( lines(k).theta ) < 10
                drawline([xy(1,1) xy(1,2)], [xy(2,1) xy(2,2)], 'green', img);
            else
                drawline([xy(1,1) xy(1,2)], [xy(2,1) xy(2,2)], 'red', img);

            end
        end
    end
end