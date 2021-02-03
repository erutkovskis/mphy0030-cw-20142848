%% Perform quadratic polynomial function calculation:

% a = randn(1,10); % random coefficients/parameters.
% x = randn(1,3); % random variables. Does not converge with
% these, needs alfa/tol adjustments.
a = [1 2 3 4 5 6 7 8 9 10]; % - checked these values with classmates. Not plagiate. Verification of convergence.
x = [1 3 5] ;
f = @quadratic_polynomial; % polynomial function handle
result = f(a,x); % compute the quadratic polynomial

%% Calculate derivatives of the quadratic polynomial

derivatives = finite_difference_gradient(f,a,x);

%% Perform gradient descent

g = @finite_difference_gradient; % derivative function handle
alpha = 10^-6; max_iter = 1000000; tolerance = 10^-3;
[x_optimised, numiter] = gradient_descent(f,x,alpha,max_iter,tolerance,g,a);

%% Gradient descent function should plot the solution verification. Saving the graph.
%% Save visualizations 
Image = getframe(gcf);
imwrite(Image.cdata,'conv_verif.jpg');