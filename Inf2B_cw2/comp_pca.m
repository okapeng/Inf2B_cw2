function [EVecs, EVals] = comp_pca(X)
% Input: 
%   X:  N x D matrix (double)
% Output: 
%   EVecs: D-by-D matrix (double) contains all eigenvectors as columns
%       NB: follow the Task 1.3 specifications on eigenvectors.
%   EVals:
%       Eigenvalues in descending order, D x 1 vector (double)
%   (Note that the i-th columns of Evecs should corresponds to the i-th element in EVals)
%% Compute PCA
    [N D] = size(X);
    % Compute the eigenvectors and eigenvalues of X
    [EVecs, EVals] = eig(my_cov(X));
    
    EVals = diag(EVals);
    % Sort the eigenvalues in descending order and rearrange the matrix of
    % eigenvectors based on the order of eigenvalues
    [tmp, ridx] = sort(EVals, 1, 'descend');
    EVals = EVals(ridx);
    EVecs = EVecs(:,ridx);
    
    % Make sure the first element of eigenvector is non-negative
    for (i=1:D)
        if EVecs(1,i)<0
            EVecs(:,i) = -1 * EVecs(:,i);
        end
    end

end

