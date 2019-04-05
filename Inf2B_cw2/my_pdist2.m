function pdist2 = my_pdist2(x, y)
% Input: 
%   x:  M x D matrix (double)
%   y:  N x D matrix (double)
% Output: 
%   pdist2: the squared Euclidean distance between each pair of row data in x and y
%% Perform vectorisation to calculate the pairwise distance between x and y
    [m d] = size(x);
    n = size(y,1);
    xx = zeros(m, 1);
    yy = zeros(n, 1);
    
    for (k=1:m) 
        xx(k,:) = x(k,:)*x(k,:)';
    end
    for (k=1:n)
        yy(k,:) = y(k,:)*y(k,:)';
    end
    
    pdist2 = repmat(xx,1,n) - 2*x*y' + repmat(yy,1,m)';
end

