function [Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
% Output:
%   Ypreds : N-by-L matrix (uint8) of predicted labels for Xtest
%% Initialisation
    L = size(Ks, 2);
    N = size(Xtest, 1);
    Ypreds = zeros(N, L);
    
    %% Run knn classification for each k
    for (i=1:L)
        k=Ks(:,i);
        % Calculate the distance between training data and test data
        di = my_pdist2(Xtrain, Xtest);
        [~, idx] = sort(di,'ascend');
        % Find the k-nearest training samples of each test data
        idx = idx(1:k,:);
        
        % Assign the test data to the class that majority of its neighbours belongs to 
        for(j=1:N)
            Ypreds(j,i) = mode(Ytrain(idx(:,j)));
        end
    end
end

