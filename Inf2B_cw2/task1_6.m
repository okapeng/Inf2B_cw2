%
%
function task1_6(MAT_ClusterCentres)
% Input:
%  MAT_ClusterCentres : file name of the MAT file that contains cluster centres C.
%       
% 
%% Initialisation
    load(MAT_ClusterCentres,'C');
    % Number of centers
    k = size(C, 1);
    imglist = zeros(28, 28, k);
    
    %% Display the image of each center
    for (i=1:k)
        imglist(:,:,i)=reshape(C(i,:), 28, 28)';
    end
    montage(imglist);
  
end
