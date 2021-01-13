function x = gradient_descent(multivar_f,...
    init_val, alpha, max_iter, toler, gradient_f)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

x = init_val;
f = @multivar_f;
g = @gradient_f;

% Test values
a = rand(1,10);
x = rand(1,3);
%% Main algorithm
grad = g(f(a,x), grid);
NumIter = 1;

while NumIter <= max_iter    
    xnew = x - alpha*grad;
    NumIter = NumIter + 1;
    x = xnew;
    if (f(a,x)-f(a,xnew))<toler
        break
    end
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
