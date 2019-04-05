%
%
function task2_8(Xtrain, Ytrain, Xtest, Ytest, epsilon, L)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Xtrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ytest  : N-by-1 label vector (uint8) for Xtest
%   epsilon : A scalar parameter for regularisation
%   L      : scalar (integer) of the number of Gaussian distributions per class
%% Applies k-means clustering to each class to obtain multiple Gaussian classifiers per class, and carries out classification
    tic
    [Ypreds, Ms, Covs] = run_mgcs(Xtrain, Ytrain, Xtest, epsilon, L);
    toc

    %%  Measure the performance of the classification experiment
    [CM acc] = comp_confmat(Ytest, Ypreds, 10);
    D = size(Xtrain, 2);
    Ms1 = Ms(1:L,:);
    Covs1 = Covs(1:L, :, :);

    N = size(Xtest, 1)
    Nerrs = N - sum(diag(CM))
    acc
    
%     save(sprintf('task2_8_cm_%d.mat', L), 'CM');
%     save(sprintf('task2_8_g%d_m1.mat', L), 'Ms1');
%     save(sprintf('task2_8_g%d_cov1.mat', L), 'Covs1');
end
