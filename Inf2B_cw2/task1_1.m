%
%
function task1_1(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)

%% Choose first ten samples from each class and display 
    for (c=0:9) 
        Xs = X(Y==c, :);
        imglist = zeros(28,28,10);
        
        for (i=1:10)
            imglist(:,:,i)=reshape(Xs(i,:)*255.0, 28, 28)';
        end
        image = montage(imglist);
        
%         input(strcat('10 samples for Class',num2str(c)), 's');
    end
end
