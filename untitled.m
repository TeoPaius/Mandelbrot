
h = zoom;
h.ActionPostCallback = @myfunction;
h.Enable = 'on';

function myfunction(obj,evd)
    newLim = evd.Axes.XLim;
    fprintf('The new X-Limits are [%.2f %.2f].\n',newLim);
    newYLim = evd.Axes.YLim;
    fprintf('The new Y-Limits are [%.2f %.2f].\n',newYLim);

end

