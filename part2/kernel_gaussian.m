function kernel = kernel_gaussian(query_pts,control_pts,lambda,sigmas)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[qry_rown,qry_coln] = size(query_pts); % useful dimentions
ctrl_rown = size(control_pts,1);

r = zeros(qry_rown); % pre-allocate

% norm and RBF of the "x - p" from the paper, assuming control points are x
for ii = 1:qry_rown
    for jj = 1:ctrl_rown
        r(ii,jj)=norm(query_pts(ii,:)-control_pts(jj,:));
    end
end

% P = ones(src_rown+1); % n+1 x n+1

K = exp(-r.^2 / 2.*sigmas.^2); % matrix of gaussians, nxn
W = diag(sigmas.^(-2)); % landmark localization errors, nxn
kernel = K+lambda*W.^(-1);

end

