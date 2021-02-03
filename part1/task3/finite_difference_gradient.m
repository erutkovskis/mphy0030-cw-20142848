function derivatives = finite_difference_gradient(f,a,x)
% derivatives  = finite_difference_gradient(f,a,x)
%   The function finite_difference_gradient calculates partial derivative
%   of the multivariate function f (f is a handle of a multivariate 
%   function) for each input element x = [x1,x2,x3].
% Inputs:
%   f       multivariate function handle
%   a       multivariate function polynomial coefficients
%   x       f function variables
% Outputs:
%   derivatives         array of partial derivatives of f(x)

dx1 = 0.000001; % some small value dx
dx2 = 0.000001;
dx3 = 0.000001;
deriv_x1 = (f(a,[x(1)+dx1,x(2),x(3)])-f(a,[x(1),x(2),x(3)]))/dx1;
deriv_x2 = (f(a,[x(1),x(2)+dx2,x(3)])-f(a,[x(1),x(2),x(3)]))/dx2;
deriv_x3 = (f(a,[x(1),x(2),x(3)+dx3])-f(a,[x(1),x(2),x(3)]))/dx3;

derivatives = [deriv_x1,deriv_x2,deriv_x3];
 
end

