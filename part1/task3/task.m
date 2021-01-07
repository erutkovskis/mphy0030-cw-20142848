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