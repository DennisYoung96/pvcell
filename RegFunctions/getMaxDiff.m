% 求帧间变化
% load('matlab.mat');

% c = diff(thermal);
% c = diff(thermal,1,3);
c = diff(sw,1,3);

% i = 1:145;
% i = 1:99;
i = 1:size(c,3);
c_sum = sum( c(:,:,i));
% c_f = reshape(c,240*320,145);
c_f = reshape(c,size(c,1)*size(c,2),size(c,3));
c_sum = sum(c_f);
figure, stem(c_sum);

c_max = max(c_f);
figure, stem(c_max);

