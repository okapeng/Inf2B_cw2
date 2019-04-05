%
%
function task2_5(Xtrain, Ytrain, Xtest, Ytest, epsilon)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  epsilon : a scalar variable (double) for covariance regularisation
%% Perform Gaussian classifier and measure the running time
    tic
    [Ypreds, Ms, Covs] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon);
    toc
    
    %% Measure the performance of the classification experiment
    [CM acc] = comp_confmat(Ytest, Ypreds, 10);

    D = size(Xtrain, 2);
    M10 = reshape(Ms(10,:), D , 1);
    Cov10 = reshape(Covs(10, :, :), D, D);

    N = size(Xtest, 1)
    Nerrs = N - sum(diag(CM))
    acc

    save('task2_5_cm.mat', 'CM');
    save('task2_5_m10.mat', 'M10');
    save('task2_5_cov10.mat', 'Cov10');
end
