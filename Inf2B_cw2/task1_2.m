%
%
function M = task1_2(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% Output:
%  M : (K+1)-by-D mean vector matrix (double)
%      Note that M(K+1,:) is the mean vector of X.
%% Determine the size of input and initialize the variables
    [m, d]=size(X);
    M = zeros(11,d);
    
    %% Calculate the mean for each class and the whole data set
    for (c=0:9) 
        M(c+1, :) = my_mean(X(Y==c, :));
    end
    M(11,:) = my_mean(X);
    
    %% Display the image of the means
    imglist = zeros(28,28,11);
    for (i=1:11)
        imglist(:,:,i)=reshape(M(i,:), 28, 28)';
    end
    montage(imglist);
    
%     save('task1_2_M.mat','M');
end
