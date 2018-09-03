function decrypted = decryption(cipher, roundkey, sBox, leftShift, polyMat)
    state = bitxor(cipher,roundkey(41:44, :)');
    state = shiftRows(state, leftShift);
    state = sBox(state + 1);
    
    for i = 1:9
        state = bitxor (state, roundkey((4*(10 - i))+1:(4*(10 - i))+4, :)');
        state = mixColumns (state, polyMat);
        state = shiftRows(state, leftShift);
        state = sBox(state + 1);
    end
    
    decrypted = bitxor(state, roundkey(1:4,:)');
end