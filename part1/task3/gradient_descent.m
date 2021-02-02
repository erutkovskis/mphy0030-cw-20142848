function [x,NumIter] = gradient_descent(multivar_f,...
    x, alpha, max_iter, toler, gradient_f,a)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%% Main algorithm

NumIter = 1;
delta = toler+1;

while NumIter <= max_iter && delta >= toler
    grad = gradient_f(multivar_f,a,x);
    x_new = x - alpha*grad;
    NumIter = NumIter + 1;
    delta = (multivar_f(a,x)-multivar_f(a,x_new));
    x = x_new;
end















%% Trash
% Feature normalisation
% mu = mean(init_val);
% sigma = std(init_val);
% feat_num = size(init_val,2);
% % Following loop normalises values for each feature
% 
% for iter=1:feat_num
%     init_val(:,iter) = (init_val(:,iter)-mu(:,iter))./sigma(:,iter);
% end
% 
% X_norm = init_val;
% m = length(y); % number of training examples
% 
% for iter = 1:max_iter
%     delta = gradient_f;
%     theta = theta - alpha*delta;
% end
% 
% 
% end
% 
