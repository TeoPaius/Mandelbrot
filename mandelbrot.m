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

parfor loopVar = 1:10; fprintf("paralel %d\n", loopVar); end 
grid();

h = zoom;
h.ActionPostCallback = @myfunction;
h.Enable = 'on';

function myfunction(obj,evd)
    cnt = 0;
    for i = 1:100
        for j = 1:100
            for k = 1:20
                cnt = cnt +  1;
            end
        end
    end
    
    newLim = evd.Axes.XLim;
    fprintf('The new X-Limits are [%.2f %.2f].\n',newLim);
    newYLim = evd.Axes.YLim;
    fprintf('The new Y-Limits are [%.2f %.2f].\n',newYLim);

end