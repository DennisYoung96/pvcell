img = img_lw;

% I=edge(img,'canny',thresholds,sigma);
I=edge(img,'canny');
[H,theta,rho] = hough(I, 'RhoResolution', 0.25, 'Theta', -90:0.5:89);
%%
for i=100
%     P = houghpeaks(H,i,'threshold',ceil(0.3*max(H(:))));
    P = houghpeaks(H,i,'threshold',ceil(0.3*max(H(:))));

%     lines = houghlines(I,theta,rho,P,'FillGap',12,'MinLength',100);
    lines = houghlines(I,theta,rho,P,'FillGap',12,'MinLength',10);
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
    hold off
end