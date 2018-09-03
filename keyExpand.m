function roundkey = keyExpand(key, s_box, rcon)

roundkey = reshape(key, 4, 4)';
for i = 5:44 
    if mod(i, 4) == 1
        temp = [roundkey(i - 1, 2) roundkey(i - 1, 3) roundkey(i - 1, 4) roundkey(i - 1, 1)];
        temp = s_box(temp + 1);
        r = rcon((i-1)/4, :);
        temp = bitxor(temp, r);
    else
        temp = roundkey(i - 1,:);
    end
     
    roundkey(i, :) = bitxor(roundkey(i - 4,:), temp);
end
end