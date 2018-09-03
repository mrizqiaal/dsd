function encrypted = encryption(plain, roundkey, s_box, leftShift, polyMat)
    state = reshape(plain, 4, 4);
    state = bitxor(state, roundkey(1:4,:)');
    
    for i = 1:9
        state = s_box(state + 1);
        state = shiftRows(state, leftShift);       
        state = mixColumns (state, polyMat);    
        state = bitxor (state, roundkey((4*i)+1:(4*i)+4, :)');
    end
    
    state = s_box(state + 1);
    state = shiftRows(state, leftShift);     
    encrypted = bitxor (state, roundkey(41:44, :)');
end