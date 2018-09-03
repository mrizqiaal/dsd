function padded = padding(t)
    padded = t;
    n = length(t);
    p = mod(n, 16);
    if(p ~= 0)
        for i = 1:16 - p
            padded = horzcat(padded, ' ');
        end
    end
end