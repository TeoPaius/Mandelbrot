function ret = stable(x,pow,const,limit, iter)
    ret = x;
    found = 1;
    while(iter > 0)
        ret = ret .^ pow + const;
        if(abs(ret) > limit)
            found = 0;
            break
        end
        iter = iter - 1;
    end
    if(found == 0)
        ret = abs(ret - limit);
    else
        ret = -100;
    end
    
end