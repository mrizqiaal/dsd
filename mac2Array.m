function mac = mac2Array(str)
    temp = [];
    for i = 1:18
        if mod(i,3) ~= 0
            temp = [temp str(i)];
        end
    end
    
    mac = size(6);
    for i = 1:6
        a = hex2dec(temp((1:2)+(2*(i-1))));
        mac(i) = a;
    end
end