function block = convertBlock(plain)
    block = [];
    for i = 1:16
        block = [block;dec2hex(plain(i))];
    end
end