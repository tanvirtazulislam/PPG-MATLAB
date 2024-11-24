function [score,loading,varriance] = PCA_SVD(X)

% variance of X
%varriance = var(X);

%this function of svd choosen because If X is m-by-n with m >= n, it is 
%equivalent to svd(X,0). For m < n, only the first m columns of V are 
%computed and S is m-by-m.

        [U,S,V] = svd(X);

        score = U*S;

        S = diag(S);

        % variance 
        varriance = S.*S;

        loading = V;
        

