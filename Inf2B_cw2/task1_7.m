%
%
function Dmap = task1_7(MAT_ClusterCentres, MAT_M, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  MAT_ClusterCentres: MAT filename of cluster centre matrix
%  MAT_M     : MAT filename of mean vectors of (K+1)-by-D, where K is
%              the number of classes (which is 10 for the MNIST data)
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specify the position of the plane
%  nbins     : scalar (integer) to specify the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.
%% load data
    load(MAT_ClusterCentres,'C');
    load(MAT_M,'M');
    load(MAT_evecs,'EVecs');
    load(MAT_evals,'EVals');
 
%% Initialisation
    Dmap = zeros(nbins*nbins, 1);
    [k D] = size(C);
    % Plot region in 784-D vector space
    plot = zeros(nbins*nbins, D);
      
    %% Initialise the 2D plot plane in 784-D vector space
    sd_X = sqrt(EVals(1,:));sd_Y = sqrt(EVals(2,:));
    mu = ( EVecs'*(M(11,:)-posVec)' )';
    mu_X = mu(:,1);mu_Y = mu(:,2);
    
    Xplot = linspace(mu_X-5*sd_X, mu_X+5*sd_X, nbins)';
    Yplot = linspace(mu_Y-5*sd_Y, mu_Y+5*sd_Y, nbins)';
    [Xv, Yv] = meshgrid(Xplot, Yplot);
    plot(:,1:2) = [Xv(:) Yv(:)];
    
    %% Apply pca to the 2D plane to convert it from principle component
    %  coordinate system to the original coordinate system 
    plot = bsxfun(@plus, (EVecs' \ plot')', posVec);

    %% Perform classification: assign each point to the closest class center
    % in the original coordinate system
    [Ds, Dmap] = min(my_pdist2(C, plot),[],1);
    Dmap = reshape(Dmap, nbins, nbins);
    
    %% Display the 2D plane with decision region
    colors = random_colours(k);
    figure;
    [CC,h] = contourf(Xplot(:), Yplot(:), Dmap);
    set(h,'LineColor','none');
    colormap(colors);
	  
end
