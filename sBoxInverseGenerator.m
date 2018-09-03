function sBox = sBoxInverseGenerator(nsBox)
    sBox = size(256);
    for i = 1:256
        sBox(i) = find(nsBox == (i - 1)) - 1;
    end
end