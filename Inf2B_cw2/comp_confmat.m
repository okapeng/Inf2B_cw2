function [CM, acc] = comp_confmat(Ytrues, Ypreds, K)
% Input:
%   Ytrues : N-by-1 ground truth label vector
%   Ypreds : N-by-1 predicted label vector
% Output:
%   CM : K-by-K confusion matrix, where CM(i,j) is the number of samples whose target is the ith class that was classified as j
%   acc : accuracy (i.e. correct classification rate)
%% Compute the confusion matrix
    CM = zeros(K,K);
    
    for (i=0:9)
        for (j=0:9)
            CM(i+1, j+1) = sum(Ypreds(Ytrues==i)==j);
        end
    end
    
    acc = sum(diag(CM)) / size(Ytrues, 1);

end
