function cov = my_cov(X)
% Input: 
%   X:  N x D matrix (double)
% Output: 
%   cov: the covariance of the matrix X
%% 
    n = size(X, 1);
    X = bsxfun(@minus, X, my_mean(X)); 
    cov = (X' * X) / n;
end