function corr = my_corr(X)
% Input: 
%   X:  N x D matrix (double)
% Output: 
%   corr: the correlation between first two columns of the input matrix X
%% 
    x=X(:,1);
    y=X(:,2);
    % Normalise the data against the mean
    xs = bsxfun(@minus,x,my_mean(x));
    ys = bsxfun(@minus,y,my_mean(y));
    corr = sum(xs.*ys) / (sqrt(sum(xs.^2)) * sqrt(sum(ys.^2)));
end
