function alpha = fit(source_pts, target_pts)
%FIT Summary of this function goes here
%   Detailed explanation goes here


[src_rown,src_coln] = size(source_pts); % useful dimentions
[tgt_rown,tgt_coln] = size(target_pts);


r = zeros(src_rown); % pre-allocate

% norm and RBF of the source points
for ii = 1:src_rown
    for jj = (ii+1):src_rown
        r(ii,jj)=norm(source_pts(ii,:)-source_pts(jj,:));
        r(jj,ii)=r(ii,jj); % size n x n
    end
end

% P = ones(src_rown+1); % n+1 x n+1
K = exp(-r.^2); % nxn

% Solve for each dimension?
alpha = zeros(tgt_rown);
for x = 1:tgt_rown
    alpha(x,1) = K(x,:) / target_pts(x,1);
end
for y = 1:tgt_rown
    alpha(y,2) = K(y,:) / target_pts(y,2);
end
for z = 1:tgt_rown
    alpha(z,3) = K(z,:) / target_pts(z,3);
end


end

% matrix1 = [K, P; P.', zeros()]; % lefthandside matrix
% matrix2 = [target_pts; zeros()]; % righthadside matrix

% coef = matrix1 \ matrix2; % solve wrt alpha
% alpha = K \ qk; 