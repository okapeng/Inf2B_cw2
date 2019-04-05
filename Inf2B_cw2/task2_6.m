%
%
function Dmap = task2_6(X, Y, epsilon, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  X        : M-by-D data matrix (double)
%  Y        : M-by-1 label vector (uint8)
%  epsilon  : scalar (double) for covariance matrix regularisation
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec   : 1-by-D vector (double) to specity the position of the plane
%  nbins     : scalar (integer) denoting the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.

%% load data
    load(MAT_evecs,'EVecs');
    load(MAT_evals,'EVals');
   
%% Initialisation
    Dmap = zeros(nbins*nbins, 1);
    D = size(X, 2);
    plot = zeros(nbins*nbins, D);
    
    %% Initialise the 2D plot plane in 784-D vector space
    sd_X = sqrt(EVals(1,:)); sd_Y = sqrt(EVals(2,:));
    mu = ( EVecs'*(my_mean(X)-posVec)' )';
    mu_X = mu(:,1);mu_Y = mu(:,2);
  
    Xplot = linspace(mu_X-5*sd_X, mu_X+5*sd_X, nbins)';
    Yplot = linspace(mu_Y-5*sd_Y, mu_Y+5*sd_Y, nbins)';
    [Xv, Yv] = meshgrid(Xplot, Yplot);
    plot(:,1:2) = [Xv(:) Yv(:)];
    
    %% Apply pca to the 2D plane to convert it from principle component
    %  coordinate system to the original coordinate system 
    plot = bsxfun(@plus, (EVecs' \ plot')', posVec);
    
    %% Perform gaussian classification in the original coordinate system
    Dmap = run_gaussian_classifiers(X, Y, plot, epsilon);
    Dmap = reshape(Dmap, nbins, nbins);
    
    %% Display the decision region
    colors = random_colours(10);
    figure;
    [CC,h] = contourf(Xplot(:), Yplot(:), Dmap);
    set(h,'LineColor','none');
    colormap(colors);
    
%     save('task2_6_dmap.mat', 'Dmap');
end
