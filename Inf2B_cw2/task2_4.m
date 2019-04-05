%
%
function [Corrs] = task2_4(Xtrain, Ytrain)
% Input:
%  Xtrain : M-by-D data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for X
% Output:
%  Corrs  : (K+1)-by-1 vector (double) of correlation $r_{12}$ 
%           for each class k = 1,...,K, and the last element holds the
%           correlation for the whole data, i.e. Xtrain.
    %% Carry out PCA and convert the training data to the first two principle components
    [EVecs, EVals] = comp_pca(Xtrain);
    
    PC = Xtrain * EVecs;
    PC = PC(:,1:2);
    %% Calculate the correlation between first two principle component for each class and the whole data set
    Corrs = zeros(11,1);
    for(i=0:9)
        PCc = PC(Ytrain==i,:);
        Corrs(i+1,:) = my_corr(PCc);
    end
    Corrs(11,:) = my_corr(PC);

end
