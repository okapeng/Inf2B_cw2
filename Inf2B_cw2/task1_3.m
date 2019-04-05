%
%
function [EVecs, EVals, CumVar, MinDims] = task1_3(X)
% Input:
%  X : M-by-D data matrix (double)
% Output:
%  EVecs, Evals: same as in comp_pca.m
%  CumVar  : D-by-1 vector (double) of cumulative variance
%  MinDims : 4-by-1 vector (integer) of the minimum number of PCA dimensions
%            to cover 70%, 80%, 90%, and 95% of the total variance.
%% Compute the pca of the input data
    [m,d] = size(X);
    [EVecs, EVals] = comp_pca(X);    
    
    save('task1_3_evecs.mat','EVecs');
    save('task1_3_evals.mat','EVals');
    
    %% calculate and plot cumulartive variance
    CumVar = cumsum(EVals);
    plot([1:d], CumVar, '.')
    xlabel('dimension');
    ylabel('cumulartive variance');
    
    %% calculate minimum dimension to reach certain percentage of variance
    MinDims = zeros(4, 1);
    TotalVar = sum(EVals); 
    percentage = [0.7 0.8 0.9 0.95];
    
    for (i=1:4)
        MinDims(i) = sum(CumVar < (percentage(i) * TotalVar)) + 1;
    end
    
    save('task1_3_cumvar.mat','CumVar');
    save('task1_3_mindims.mat','MinDims');
    
end
