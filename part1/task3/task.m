%%

a = [0.8147,0.9058,0.1270,0.9134,0.6324,0.0975,0.2785,0.5469,0.9575,0.9649];
x = [0.1576,0.9706,0.9572];
f = quadratic_polynomial(a,x);
deriv = finite_difference_gradient();
%% gradient descent test
var1 = ;
var2 = ;
theta = ;
step_size = ;
NumIter = ;
MaxIter = ;
toler = ;
gradient = ;


while gnorm >= toler && NumIter <= MaxIter && dx >= dxmin
    g = grad(x);
    gnorm = norm(g);
    xnew = x - NumIter*g;
    NumIter = NumIter + 1;
    dx = norm(xnew - x);
    x = xnew;
end

%% single var
for iter = 1:NumIter
    new_x1 = x(1) - alpha*(1/m)*sum((X*x).*X(:,1));
    new_x2 = x(2) - alpha*(1/m)*sum((X*x).*X(:,2));
    
    x(1) = new_x1;
    x(2) = new_x2;
end

%% multivar, stackoverflow

m = length()