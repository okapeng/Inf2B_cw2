%
%
function task2_3(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector for X (unit8)
%% Compute PCA
    [EVecs, EVals] = comp_pca(X);
    PC = X * EVecs;
    PC = PC(:,1:2);
    %% Draw the contour of Gaussian classification for each class
    for (c=0:9)
        PCc = PC(Y==c,:);
        % Calculate the mean and covariance
        mu = my_mean(PCc);
        covar = my_cov(PCc);
        sd = sqrt(diag(covar));

        % Determine the elipse contour based on mean and covariance
        t=-pi:0.01:pi;
        x=mu(:,1)+sd(1)*cos(t);
        y=mu(:,2)+sd(2)*sin(t);
        % Calculate the rotation 
        th = covar(1,2);
        rotation = [cos(th) sin(th);-sin(th) cos(th)];
        for(i=1:length(x))
            grid(i,:) = [x(i) y(i)]*rotation;
        end
        
        % Plot the contour
        mu = mu*rotation;
        plot(grid(:,1),grid(:,2))
        text(mu(:,1),mu(:,2),(num2str(c)));
        hold on;
    end
    %% 
    xlabel('1st principal component');
    ylabel('2nd principal component');
end
