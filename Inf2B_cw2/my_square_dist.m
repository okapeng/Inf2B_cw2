function sq_dist = my_square_dist(X, v)
% Input: 
%   X:  M x D matrix (double)
%   v:  M x 1 vector
% Output: 
%   sq_dist:  the squared Euclidean distances between each row of X and v
%% 
    sq_dist = sum(bsxfun(@minus, X, v).^2, 2)';
end