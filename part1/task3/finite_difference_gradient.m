function gradient = finite_difference_gradient(f,grid)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

a = [0.8147,0.9058,0.1270,0.9134,0.6324,0.0975,0.2785,0.5469,0.9575,0.9649];
npts = 100;
x1 = linspace(-10,10,npts);
x2 = linspace(-10,10,npts);
x3 = linspace(-10,10,npts);
f=@(x1,x2,x3) (a(1)+a(2).*x1.^2+a(3).*x2.^2+a(4).*x3.^2+a(5).*x1.*x3+a(6).*x1.*x3 ...
    +a(7).*x2.*x3+a(8).*x1+a(9).*x2+a(10).*x3);

f_der_x1 = (f(x1(2),x2(1),x3(1))-f(x1(1),x2(1),x3(1)))/((x1(2)-x1(1)));
f_der_x2 = (f(x1(1),x2(2),x3(1))-f(x1(1),x2(1),x3(1)))/((x2(2)-x2(1)));
f_der_x3 = (f(x1(1),x2(1),x3(2))-f(x1(1),x2(1),x3(1)))/((x3(2)-x3(1)));

for x1cur = 2:x1(end-1)
    for x2cur = 2:x2(end-1)
        for x3cur = 2:x3(end-1)
            f_der_x3 = [f_der_x3, (f(x1(x1cur),x2(x2cur),x3(x3cur+1))-f(x1(x1cur),x2(x2cur),x3(x3cur-1)))/((x3(x3cur+1)-x3(x3cur-1)))];
        end
        f_der_x2 = [f_der_x2, (f(x1(x1cur),x2(x2cur+1),x3(x3cur))-f(x1(x1cur),x2(x2cur-1),x3(x3cur)))/((x2(x2cur+1)-x2(x2cur-1)))];
    end
    f_der_x1 = [f_der_x1, (f(x1(x1cur+1),x2(x2cur),x3(x3cur))-f(x1(x1cur-1),x2(x2cur),x3(x3cur)))/((x1(x1cur+1)-x1(x1cur-1)))];
end

f_der_x1 = [f_der_x1,(f(x1(end),x2(end),x3(end))-f(x1(end-1),x2(end),x3(end)))/(x1(end)-x1(end-1))];
f_der_x2 = [f_der_x2,(f(x1(end),x2(end),x3(end))-f(x1(end),x2(end-1),x3(end)))/(x2(end)-x2(end-1))];
f_der_x3 = [f_der_x3,(f(x1(end),x2(end),x3(end))-f(x1(end),x2(end),x3(end-1)))/(x3(end)-x3(end-1))];

MyGrad = [f_der_x1, f_der_x2, f_der_x3];

end

