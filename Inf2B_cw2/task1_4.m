%
%
function task1_4(EVecs)
% Input:
%  Evecs : the same format as in comp_pca.m
%
%% Display the image of first ten principle axes of PCA
    for (i=1:10)
        imglist(:,:,i)=reshape(EVecs(:,i), 28, 28)';
    end
    image = montage(imglist, 'DisplayRange', [-0.2, 0.2]);

end
