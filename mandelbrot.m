f = @(x,c) x.^2 + c;
iterations = 100;
const = 1;
limit = 1.5;
start = 0;
fi = figure(1);
figure(fi);
q = parallel.pool.DataQueue();
afterEach(q, @callback);

%x_axis = linspace(-2,2,100);
%y_axis = linspace(-2,2,100);

%[X,Y] = meshgrid(-2:0.01:2 ,-2:0.01:2); 
%pixels = complex(X,Y);
%pixels = pixels(:);
%Z = sqrt(X.^2 + Y.^2);
%Z = arrayfun(@(x) stable(start,2,x,limit,iterations),pixels);

plot(5,6, 'o');
hold on;

%scatter(X(:),Y(:),1,Z(:));

for i = 1: 1000
    real = randi([0 1000],1,1);
    imag = randi([0 1000],1,1);
    parfeval(@doSmth ,1, complex(real,imag),q);
    
end

function ret = doSmth(x, q)
    send(q, x);
    ret = 6;
end

function callback(nr)
    nr
    plot(nr,'o');
    drawnow
end