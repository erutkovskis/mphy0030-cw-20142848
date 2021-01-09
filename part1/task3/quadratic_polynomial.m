function f = quadratic_polynomial(a,x)
% f = quadratic_polynomial(a,x);
% Function outputs a solution for a multivariate polynomial of degree 2 
% for three variables (f,a,x).

% Error check.
if nargin ~= 2
    error('Expected a and x inputs');
end
if size(a,2) ~= 10
    error('Vector "a" expected to contain 10 variables');
end
% if size(x,2) ~= 3
%     error('Vector "x" expected to conatin 3 variables');
% end

a = [0.8147,0.9058,0.1270,0.9134,0.6324,0.0975,0.2785,0.5469,0.9575,0.9649];
% x = [0.1576,0.9706,0.9572];
f=a(1)+a(2)*x(1)^2+a(3)*x(2)^2+a(4)*x(3)^2+a(5)*x(1)*x(3)+a(6)*x(1)*x(3) ...
    +a(7)*x(2)*x(3)+a(8)*x(1)+a(9)*x(2)+a(10)*x(3);
f=@(x1,x2,x3) (a(1)+a(2).*x1.^2+a(3).*x2.^2+a(4).*x3.^2+a(5).*x1.*x3+a(6).*x1.*x3 ...
    +a(7).*x2.*x3+a(8).*x1+a(9).*x2+a(10).*x3);

end
