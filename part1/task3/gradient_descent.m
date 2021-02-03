function [x,NumIter] = gradient_descent(multivar_f,...
    x, alpha, max_iter, toler, gradient_f,a)
% [x,NumIter] = gradient_descent(multivar_f, x, alpha, max_iter, toler, ...
% gradient_f,a)
%
% This function uses gradient descent algorithm showed in the lecture and 
% outputs optimised function values.
% Inputs:
%   multivar_f      multivariate function handle
%   x               initial x values to be optimised
%   alpha           step size
%   max_iter        maximum number of iterations
%   toler           tolerance on change between old and subsequent x value
%   gradient_f      gradient function handle
%   a               multivariate function polynomial coefficients
% Output:
%   x               optimised function variable
%   NumIter         how many iterations it took to get to the optimum

NumIter = 1; % initial value
delta = toler+1; % delta slightly bigger than the tolerance
J_history = [];

while NumIter <= max_iter && delta >= toler
    grad = gradient_f(multivar_f,a,x); % derivative
    x_new = x - alpha*grad; % learn according to the derivative and step
    NumIter = NumIter + 1; % increase counter
    delta = (multivar_f(a,x)-multivar_f(a,x_new)); % compute difference that will be compared with tolerance
    x = x_new; % update the value
    % Verification method from Andrew NG machine learning course on Coursera
    % Register and visualise x value and functions history
    J_history(NumIter) = multivar_f(a,x);
end
plot(J_history); title('Solution verification')

end