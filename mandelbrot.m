f = @(x,c) x.^2 + c;
iterations = 100;
const = 1;
limit = 1.5;
start = 0;

x_axis = linspace(-2,2,100);
y_axis = linspace(-2,2,100);

[X,Y] = meshgrid(-2:0.01:2 ,-2:0.01:2); 
pixels = complex(X,Y);
pixels = pixels(:);
%Z = sqrt(X.^2 + Y.^2);
Z = arrayfun(@(x) stable(start,2,x,limit,iterations),pixels);


scatter(X(:),Y(:),1,Z(:));

grid();
