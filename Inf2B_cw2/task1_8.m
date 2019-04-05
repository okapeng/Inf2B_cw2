%
%
function [initSSE, finSSE, iterTimes] = task1_8(Xtrain, numOfCentres, numOfExp, distribution)
%  NB: there is no specification to this function.
%% Initicalisation
    initialCentres = zeros(numOfCentres, 784);
    initSSE = zeros(numOfExp, 1);
    finSSE = zeros(numOfExp,1);
    iterTimes = zeros(numOfExp,1);

    %% Repeat the experiment for more general result
    for(i=1:numOfExp)
        %% Choose random values of initial centres with certain type of distribution
        if(distribution == 'uni')
            % uniformly distributed
            initialCentres = rand(numOfCentres, 784);
        else
            % normally distributed
            initialCentres = randn(numOfCentres, 784);
        end
        
        %% Performing k-means and measure the performance based on SSE
        [C, idx, SSE] = my_kMeansClustering(Xtrain, numOfCentres, initialCentres);
        initSSE(i,:) = SSE(1,:);
        finSSE(i,:) = SSE(length(SSE), :);
        iterTimes(i,:) = length(SSE)-1;
    end
    
%     save(sprintf('task1_8_%s_%d.mat', distribution, numOfCentres), 'initSSE','finSSE', 'iterTimes');
end
