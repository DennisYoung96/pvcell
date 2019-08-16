%%
% threshold_1：整数，主方向的数量
% threshold_2：小数，0~1，副方向的比例
function im_after_filter = myFFT2DLPF(im, dim, threshold_1, threshold_2)
    if sum( size(im) > 1) ~= 2 
        im = rgb2gray(im);
    end
    if dim ~= 2 && dim ~=1
        error('Dimension error!');
    end
    if threshold_1 > min( size(im)) || threshold_1 < 0 
        error('Threshold error!');
    end    
    im_fft = fftshift( fft2(im));
    % 这里是对频域进行滤波
    % 但是似乎没有效果
%     fft_f = fspecial('log',size(im_fft),1000);
%     im_fft = im_fft .* mat2gray( -fft_f);
%     im_fft(-1 + round(size(im_fft, 1)/2) : 1 + round(size(im_fft, 1)/2),...
%         -1 + round(size(im_fft, 2)/2) : 1 + round(size(im_fft, 2)/2)) = complex(0);
     im_fft_filter = complex( zeros( size( im_fft)));   
    switch dim
        case 1
            im_fft_filter( -threshold_1 + round(size(im_fft, dim)/2) : threshold_1 + round(size(im_fft, dim)/2),...
                round((-threshold_2 + 1) * size(im_fft, 2)/2) : round((+threshold_2 + 1) * size(im_fft, 2)/2)) =...
            im_fft(-threshold_1 + round(size(im_fft, dim)/2) :  threshold_1 + round(size(im_fft, dim)/2),...
                round((-threshold_2 + 1) * size(im_fft, 2)/2) : round((+threshold_2 + 1) * size(im_fft, 2)/2));
            im_after_filter = abs( ifft2( fftshift( im_fft_filter)));
        case 2 
            im_fft_filter( round((-threshold_2 + 1) * size(im_fft, 1)/2) : round((threshold_2 + 1) * size(im_fft, 1)/2),...
                -threshold_1 + round(size(im_fft, dim)/2) : threshold_1 + round(size(im_fft, dim)/2)) =...
            im_fft( round((-threshold_2 + 1) * size(im_fft, 1)/2) : round((threshold_2 + 1) * size(im_fft, 1)/2),...
                -threshold_1 + round(size(im_fft, dim)/2) : threshold_1 + round(size(im_fft, dim)/2));
            im_after_filter = abs( ifft2( fftshift( im_fft_filter)));           
    end
end

%     switch dim
%         case 1
%             im_fft_filter( -threshold_1 + round(size(im_fft, dim)/2) : threshold_1 + round(size(im_fft, dim)/2), :) =...
%             im_fft(-threshold_1 + round(size(im_fft, dim)/2) : threshold_1 + round(size(im_fft, dim)/2), :);
%             im_after_filter = abs( ifft2( fftshift( im_fft_filter)));
%         case 2
%             im_fft_filter(:, -threshold_1 + round(size(im_fft, dim)/2) : threshold_1 + round(size(im_fft, dim)/2)) =...
%             im_fft(:, -threshold_1 + round(size(im_fft, dim)/2) : threshold_1 + round(size(im_fft, dim)/2));
%             im_after_filter = abs( ifft2( fftshift( im_fft_filter)));           
%     end
