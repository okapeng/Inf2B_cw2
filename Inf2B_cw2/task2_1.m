%
%
function task2_1(Xtrain, Ytrain, Xtest, Ytest, Ks)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain

%% run knn classifier and measure time
    tic
    Ypreds = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks);
    toc
    %% Measure the performance for each knn classification
    L = size(Ks, 2);
    for (i=1:L)
        [CM, acc] = comp_confmat(Ytest, Ypreds(:, i), 10);

        k = Ks(:,i)
        N = size(Xtest,1)
        Nerrs = N -sum(diag(CM))
        acc
        
%         save(sprintf('task2_1_cm%d.mat',k), 'CM');
    end
end
