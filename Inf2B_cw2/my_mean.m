function mean = my_mean(X)
% Input: 
%   X:  N x D matrix (double)
% Output: 
%   mean: the mean of each column of X
%% 
    n = size(X, 1);
    mean = sum(X)/n;
end
