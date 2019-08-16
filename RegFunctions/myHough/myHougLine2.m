%% function myHougLine(img, thresholds_canny, sigma, rho_resolution, theta, thresholds_coef, hood_size_coef, fill_gap, min_length)

function [BW, H, P, lines] = myHougLine2(img, sigma, rho_resolution, theta_resolution, thresholds_coef, fill_gap, min_length)

    [~,~,ColorChannel] = size(img);
    if ColorChannel > 1
        img = rgb2gray(img);
    end
    
%     BW = edge(img, 'canny', thresholds_canny, sigma);

    BW = edge(img, 'canny', [], sigma);
%     [H,theta,rho] = hough(I, 'RhoResolution', 0.5, 'Theta', -90:0.1:89);
    [H,theta,rho] = hough(BW, 'RhoResolution', rho_resolution, 'Theta', -90:theta_resolution:89);

%     [H,theta,rho] = hough(BW, 'RhoResolution', rho_resolution, 'Theta', theta);

    for i=1000
%     P = houghpeaks(H,i,'threshold',ceil(0.3*max(H(:))));
        P = houghpeaks(H, i, 'threshold', ceil (thresholds_coef * max( H(:))));
%     lines = houghlines(I, theta, rho, P, 'FillGap',fill_gap,'MinLength',100);
        lines = houghlines(BW, theta, rho, P, 'FillGap', fill_gap, 'MinLength', min_length);
%     figure(i+6), imshow(img), hold on
        figure, imshow(img), hold on
        
        max_len = 0;
        for k = 1:length(lines)
            xy = [lines(k).point1; lines(k).point2];
            plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');hold on;

        % Plot beginnings and ends of lines
            plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');hold on;
            plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');hold on;

        % Determine the endpoints of the longest line segment
            len = norm(lines(k).point1 - lines(k).point2);
            if ( len > max_len)
                max_len = len;
                xy_long = xy;
            end
        end
% highlight the longest line segment
        plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');
%         hold off
    end
end