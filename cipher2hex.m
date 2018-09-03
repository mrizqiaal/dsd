function hex = cipher2hex(cipher)
    hex = [];
    for i = 1:16
        hex = [hex, dec2hex(cipher(i), 2), ' '];
    end
end