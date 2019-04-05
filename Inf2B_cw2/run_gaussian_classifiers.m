function [Ypreds, Ms, Covs] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   epsilon : A scalar variable (double) for covariance regularisation
% Output:
%  Ypreds : N-by-1 matrix (uint8) of predicted labels for Xtest
%  Ms     : K-by-D matrix (double) of mean vectors
%  Covs   : K-by-D-by-D 3D array (double) of covariance matrices

%YourCode - Bayes classification with multivariate Gaussian distributions.
%% Initialisation
    [N D] = size(Xtest);
    M = size(Xtrain, 1);
    % Number of classes
    K = max(Ytrain)+1;
    Ms = zeros(K, D);
    Covs = zeros(K, D, D);
    % Log posterior probabilities for each class
    Lps = zeros(N, 10);
    %% Compute the log posterior probabilities for each class
    for(c=1:K)
        Xc = Xtrain(Ytrain==c-1,:);
        mu = my_mean(Xc);
        covar = my_cov(Xc) + epsilon*eye(D);
        Pc = size(Xc,1)/M;
        
        Ms(c, :) = mu;
        Covs(c, :, :) = covar;
        
        Xtest_c = bsxfun(@minus, Xtest, mu);
        fact = sum(((Xtest_c/covar).*Xtest_c), 2);
        Lps(:, c) = -(fact + logdet(covar))/2 + log(Pc);
    end
    
    %% Assign test samples to the class with highest posterior probability
    [L idx] = max(Lps,[] ,2);
    Ypreds = idx-1;

end
