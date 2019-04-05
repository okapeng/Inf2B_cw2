%
%
function task1_5(X, Ks)
% Input:
%  X  : M-by-D data matrix (double)
%  Ks : 1-by-L vector (integer) of the numbers of nearest neighbours
%% Perform k-means clustering to the training data and measure the performance of each k
    for (k=Ks)
        k
        tic
        [C, idx, SSE] = my_kMeansClustering(X, k, X(1:k,:));
        toc
        
        L = length(SSE);
        plot(1:L, SSE);
        text(L+2, SSE(L,1), sprintf('%d-NN', k));
        hold on;

%         save(sprintf('task1_5_c_%d.mat',k), 'C');
%         save(sprintf('task1_5_idx_%d.mat',k), 'idx');
%         save(sprintf('task1_5_sse_%d.mat',k), 'SSE');
    end
end
