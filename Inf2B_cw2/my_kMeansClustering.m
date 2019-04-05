%
function [C, idx, SSE] = my_kMeansClustering(X, k, initialCentres, maxIter)
% Input
%   X : N-by-D matrix (double) of input sample data
%   k : scalar (integer) - the number of clusters
%   initialCentres : k-by-D matrix (double) of initial cluster centres
%   maxIter  : scalar (integer) - the maximum number of iterations
% Output
%   C   : k-by-D matrix (double) of cluster centres
%   idx : N-by-1 vector (integer) of cluster index table
%   SSE : (L+1)-by-1 vector (double) of sum-squared-errors

  %% If 'maxIter' argument is not given, we set by default to 500
  if nargin < 4
    maxIter = 500;
  end
  
    %% Initialisation
    [n, d] = size(X);
    C = initialCentres;
    % previous partition
    idx_prev = zeros(n,1);
    xx = zeros(n, 1);
    cc = zeros(k, 1);
    
    %% Special case: 1 center, converge after one iteration
    if k == 1
        idx = ones(n,1);
        SSE(1,:) = sum(my_square_dist(X, C));
        C = my_mean(X);
        SSE(2,:) = sum(my_square_dist(X, C));
        return
    end
    
    %% Preparation for the vectorisation of computing Euclidean distance between centers and training data
    for (j=1:n)
        xx(j,:) = X(j,:)*X(j,:)';
    end
    xx = repmat(xx,1,k);
    
    %% Iterate the process of assignment and update until the partition stablise
    for i = 1:maxIter
        % Calculate the minimum Euclidean distance between training data 
        % and each cluster center to allocate sample to the closest center
        for (j=1:k)
            cc(j,:) = C(j,:)*C(j,:)';
        end
        D = xx - 2*X*C' + repmat(cc,1,n)';
        [Ds, idx] = min(D, [], 2);
        SSE(i,1) = sum(Ds);
    
        % Update the centers based on the new allocation
        for c = 1:k
            C(c, :) = my_mean( X(idx==c,:) );
        end
        
        % Terminate if the result converges, i.e. stable partitions
        if( sum( abs(idx - idx_prev) ) == 0 )
            break;
        end
        idx_prev = idx; 
    end
end
