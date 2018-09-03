function cipher = string2cipher(str)
    str = strsplit(str, ' ');
    cipher = size(16);
    for i = 1:16
        cipher(i) = hex2dec(str(i));
    end
    cipher = reshape(cipher, 4, 4);
end