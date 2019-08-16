%% �༶����������
% ���� cell ����
function img_pyramid = getImgPyramid(img, up_level, down_level)
    img_pyramid{up_level + 1} = img;
    for i = 1:down_level
        img_pyramid{up_level + 1 +i} = impyramid(img_pyramid{up_level +i}, 'reduce');
    end
    for i = 1:up_level
         img_pyramid{up_level + 1 - i} = impyramid(img_pyramid{up_level + 2 - i}, 'expand');
    end
end