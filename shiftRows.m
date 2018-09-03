function nstate = shiftRows(state, leftShift)
    nstate = zeros(4, 4);
    for i = 1:4
        for j = 1:4
            nstate(i,j) = state(i,leftShift(i,j));
        end
    end
end